<?php

namespace App\DataFixtures;

use App\Entity\Product;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class ProductFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        // Baskets Jordan
        $basketsData = [
            [
                'name' => 'Air Jordan 1 Retro High OG',
                'model' => 'Chicago',
                'price' => '169.99',
                'type' => 'basket',
                'quantity' => 15,
                'image' => 'https://m.media-amazon.com/images/I/71Fi4DZJ+1L._AC_UY900_.jpg',
                'description' => 'La légendaire Air Jordan 1 dans sa version Chicago originale. Un classique intemporel avec du cuir premium blanc et rouge.'
            ],
            [
                'name' => 'Air Jordan 4 Retro',
                'model' => 'Black Cat',
                'price' => '199.99',
                'type' => 'basket',
                'quantity' => 8,
                'image' => 'https://images.unsplash.com/photo-1608231387042-66d1773070a5?w=400&h=300&fit=crop',
                'description' => 'Air Jordan 4 entièrement noire, surnommée "Black Cat". Design épuré et élégant pour un look streetwear parfait.'
            ],
            [
                'name' => 'Air Jordan 11 Retro',
                'model' => 'Bred',
                'price' => '219.99',
                'type' => 'basket',
                'quantity' => 12,
                'image' => 'https://images.unsplash.com/photo-1600269452121-4f2416e55c28?w=400&h=300&fit=crop',
                'description' => 'La mythique Air Jordan 11 Bred avec son vernis iconique. Portée par Michael Jordan lors de sa victoire en 1996.'
            ],
            [
                'name' => 'Air Jordan 3 Retro',
                'model' => 'White Cement',
                'price' => '189.99',
                'type' => 'basket',
                'quantity' => 6,
                'image' => 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400&h=300&fit=crop',
                'description' => 'Air Jordan 3 White Cement, première chaussure conçue par Tinker Hatfield. Motif éléphant emblématique.'
            ],
            [
                'name' => 'Air Jordan 1 Low',
                'model' => 'Triple White',
                'price' => '89.99',
                'type' => 'basket',
                'quantity' => 20,
                'image' => 'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?w=400&h=300&fit=crop',
                'description' => 'Version basse de la Air Jordan 1 en coloris entièrement blanc. Parfait pour le quotidien.'
            ],
            [
                'name' => 'Air Jordan 6 Retro',
                'model' => 'Infrared',
                'price' => '199.99',
                'type' => 'basket',
                'quantity' => 0,
                'image' => 'https://images.unsplash.com/photo-1551107696-a4b0c5a0d9a2?w=400&h=300&fit=crop',
                'description' => 'Air Jordan 6 Infrared, modèle porté par MJ lors de son premier titre NBA. Accents rouge infrarouge distinctifs.'
            ]
        ];

        // Vêtements Jordan
        $clothesData = [
            [
                'name' => 'Jordan T-Shirt',
                'model' => 'Jumpman Logo',
                'price' => '34.99',
                'type' => 'vêtement',
                'quantity' => 25,
                'image' => 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400&h=300&fit=crop',
                'description' => 'T-shirt Jordan classique avec le logo Jumpman emblématique. Coton premium pour un confort optimal.'
            ],
            [
                'name' => 'Jordan Hoodie',
                'model' => 'Flight Essentials',
                'price' => '79.99',
                'type' => 'vêtement',
                'quantity' => 18,
                'image' => 'https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=400&h=300&fit=crop',
                'description' => 'Sweat à capuche Jordan Flight Essentials. Molleton brossé pour une chaleur et un confort durables.'
            ],
            [
                'name' => 'Jordan Short',
                'model' => 'Jumpman Diamond',
                'price' => '49.99',
                'type' => 'vêtement',
                'quantity' => 22,
                'image' => 'https://images.unsplash.com/photo-1591195853828-11db59a44f6b?w=400&h=300&fit=crop',
                'description' => 'Short Jordan Jumpman Diamond. Tissu léger et respirant, parfait pour le sport et le streetwear.'
            ],
            [
                'name' => 'Jordan Tracksuit',
                'model' => 'Jumpman Air',
                'price' => '129.99',
                'type' => 'vêtement',
                'quantity' => 10,
                'image' => 'https://images.unsplash.com/photo-1556906781-9a412961c28c?w=400&h=300&fit=crop',
                'description' => 'Ensemble de survêtement Jordan Jumpman Air. Design moderne avec détails rétro-inspirés.'
            ],
            [
                'name' => 'Jordan Cap',
                'model' => 'Jumpman Snapback',
                'price' => '29.99',
                'type' => 'vêtement',
                'quantity' => 30,
                'image' => 'https://images.unsplash.com/photo-1588850561407-ed78c282e89b?w=400&h=300&fit=crop',
                'description' => 'Casquette Jordan Jumpman Snapback. Broderie premium du logo Jumpman sur le devant.'
            ],
            [
                'name' => 'Jordan Jacket',
                'model' => 'Flight Heritage',
                'price' => '159.99',
                'type' => 'vêtement',
                'quantity' => 7,
                'image' => 'https://i.ebayimg.com/00/s/MTYwMFgxNjAw/z/nfwAAOSw3Mhla40k/$_57.JPG?set_id=880000500F',
                'description' => 'Veste Jordan Flight Heritage. Style vintage avec technologies modernes pour un look authentique.'
            ],
            [
                'name' => 'Jordan Tank Top',
                'model' => 'Dri-FIT',
                'price' => '39.99',
                'type' => 'vêtement',
                'quantity' => 0,
                'image' => 'https://images.unsplash.com/photo-1503341504253-dff4815485f1?w=400&h=300&fit=crop',
                'description' => 'Débardeur Jordan Dri-FIT. Technologie d\'évacuation de l\'humidité pour des performances optimales.'
            ]
        ];

        // Créer les produits baskets
        foreach ($basketsData as $data) {
            $product = new Product();
            $product->setName($data['name'])
                   ->setModel($data['model'])
                   ->setPrice($data['price'])
                   ->setType($data['type'])
                   ->setQuantity($data['quantity'])
                   ->setImage($data['image'])
                   ->setDescription($data['description']);
            
            $manager->persist($product);
        }

        // Créer les produits vêtements
        foreach ($clothesData as $data) {
            $product = new Product();
            $product->setName($data['name'])
                   ->setModel($data['model'])
                   ->setPrice($data['price'])
                   ->setType($data['type'])
                   ->setQuantity($data['quantity'])
                   ->setImage($data['image'])
                   ->setDescription($data['description']);
            
            $manager->persist($product);
        }

        $manager->flush();
    }
}