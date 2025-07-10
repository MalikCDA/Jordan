<?php

namespace App\Controller\Admin;

use App\Entity\Product;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\ChoiceField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IntegerField;
use EasyCorp\Bundle\EasyAdminBundle\Field\MoneyField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;

class ProductCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Product::class;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            TextField::new('name', 'Nom'),
            TextField::new('model', 'Modèle'),
            MoneyField::new('price', 'Prix')->setCurrency('EUR'),
            ChoiceField::new('type', 'Type')
                ->setChoices([
                    'Vêtement' => 'vêtement',
                    'Basket' => 'basket'
                ]),
            IntegerField::new('quantity', 'Quantité'),
            ImageField::new('image', 'Image')
                ->setBasePath('uploads/products')
                ->setUploadDir('public/uploads/products'),
            TextareaField::new('description', 'Description'),
        ];
    }
}