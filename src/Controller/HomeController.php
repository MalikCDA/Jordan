<?php

namespace App\Controller;

use App\Entity\Product;
use App\Repository\ProductRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    #[Route('/', name: 'app_home')]
    public function index(ProductRepository $productRepository, Request $request): Response
    {
        $type = $request->query->get('type');
        
        if ($type && in_array($type, ['vêtement', 'basket'])) {
            $products = $productRepository->findAvailableByType($type);
        } else {
            $products = $productRepository->findAvailable();
        }

        return $this->render('home/index.html.twig', [
            'products' => $products,
            'current_type' => $type,
        ]);
    }
}