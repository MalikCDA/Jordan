<?php

namespace App\Repository;

use App\Entity\Product;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

class ProductRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Product::class);
    }

    public function findAvailable(): array
    {
        return $this->createQueryBuilder('p')
            ->where('p.quantity > 0')
            ->orderBy('p.name', 'ASC')
            ->getQuery()
            ->getResult();
    }

    public function findAvailableByType(string $type): array
    {
        return $this->createQueryBuilder('p')
            ->where('p.quantity > 0')
            ->andWhere('p.type = :type')
            ->setParameter('type', $type)
            ->orderBy('p.name', 'ASC')
            ->getQuery()
            ->getResult();
    }
}