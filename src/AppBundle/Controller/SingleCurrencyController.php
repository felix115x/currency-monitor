<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use AppBundle\Service\CurrencyService;

class SingleCurrencyController extends Controller
{
    const MAX_DAYS = 10; // TODO could be passed as parameter

    /**
     * @Route("/currency{code}", name="currency")
     */
    public function indexAction($code)
    {
        $currencyService = $this->container->get('currency_service');
        $response = $currencyService->getExchangeData(null, self::MAX_DAYS);

        $rates = $response;
        $recentDates = $currencyService->getRecentDates(self::MAX_DAYS);
        $currencies = $currencyService->getCurrencyData();

        return $this->render('currency/currency.html.twig', [
            'exchange_rates' => $rates,
            'recent_dates' => $recentDates,
            'code' => $code,
        ]);
    }
}
