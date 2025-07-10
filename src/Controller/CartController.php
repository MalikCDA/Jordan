<?php

namespace App\Controller;

use App\Entity\CartItem;
use App\Entity\Product;
use App\Repository\CartItemRepository;
use App\Repository\ProductRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/cart')]
class CartController extends AbstractController
{
    #[Route('/', name: 'app_cart')]
    public function index(CartItemRepository $cartItemRepository, Request $request): Response
    {
        $sessionId = $request->getSession()->getId();
        $cartItems = $cartItemRepository->findBy(['sessionId' => $sessionId]);

        $total = array_reduce($cartItems, function ($carry, $item) {
            return $carry + $item->getTotalPrice();
        }, 0);

        return $this->render('cart/index.html.twig', [
            'cart_items' => $cartItems,
            'total' => $total,
        ]);
    }

    #[Route('/add/{id}', name: 'app_cart_add')]
    public function add(Product $product, Request $request, EntityManagerInterface $entityManager, CartItemRepository $cartItemRepository): Response
    {
        if (!$product->isAvailable()) {
            $this->addFlash('error', 'Ce produit n\'est plus disponible.');
            return $this->redirectToRoute('app_home');
        }

        $sessionId = $request->getSession()->getId();
        
       
        $existingCartItem = $cartItemRepository->findOneBy([
            'product' => $product,
            'sessionId' => $sessionId
        ]);

        if ($existingCartItem) {
            if ($existingCartItem->getQuantity() >= $product->getQuantity()) {
                $this->addFlash('error', 'Stock insuffisant pour ce produit.');
                return $this->redirectToRoute('app_home');
            }
            $existingCartItem->setQuantity($existingCartItem->getQuantity() + 1);
        } else {
            $cartItem = new CartItem();
            $cartItem->setProduct($product);
            $cartItem->setQuantity(1);
            $cartItem->setSessionId($sessionId);
            $entityManager->persist($cartItem);
        }

        // Décrémenter le stock
        $product->setQuantity($product->getQuantity() - 1);
        $entityManager->flush();

        $this->addFlash('success', 'Produit ajouté au panier !');
        return $this->redirectToRoute('app_home');
    }

    #[Route('/remove/{id}', name: 'app_cart_remove')]
    public function remove(CartItem $cartItem, EntityManagerInterface $entityManager): Response
    {
        // Remettre le stock
        $product = $cartItem->getProduct();
        $product->setQuantity($product->getQuantity() + $cartItem->getQuantity());

        $entityManager->remove($cartItem);
        $entityManager->flush();

        $this->addFlash('success', 'Produit retiré du panier.');
        return $this->redirectToRoute('app_cart');
    }
}