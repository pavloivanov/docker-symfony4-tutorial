<?php
namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;


class BlogController extends AbstractController
{
    /**
     * @Route("/blog", methods={"GET", "HEAD"}, name="blog_list")
     */
    public function list()
    {
        return  $this->render('lucky/number.html.twig', [
            'number' => 1
        ]);
    }

    /**
     * @Route(
     *     "/contact",
     *     name="contact",
     *     condition="context.getMethod() in ['GET', 'HEAD'] and request.headers.get('User-Agent') matches '/chrome/i'"
     * )
     */
    public function contact()
    {
        return  $this->render('lucky/number.html.twig', [
            'number' => 2
        ]);
    }
}