<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use AppBundle\Service\CurrencyService;

class MonitoringPlotController extends Controller
{
    const TIMELINE_FORMAT = 'd-m-Y';
    /**
     * @Route("/monitoring", name="monitoring")
     */
    public function indexAction(Request $request)
    {
        $currencyService = $this->container->get('currency_service');
        $response = $currencyService->getExchangeData(null, 5);

        $rates = $response;
        $recentDates = $currencyService->getRecentDates(5);
        $currencies = $currencyService->getCurrencyData();

        return $this->render('monitoring/plots.html.twig', [
            'exchange_rates' => $rates,
            'recent_dates' => $recentDates,
            'currencies' => array_column($currencies, 'code'),
        ]);
    }

    public function selectCurrenciesAction(Request $request)
    {

    }
}
