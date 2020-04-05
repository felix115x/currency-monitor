<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use AppBundle\Service\CurrencyService;

class HomeController extends Controller
{
    const DEFAULT_FORMAT = 'Y-m-d';

    /**
     * @Route("/", name="homepage")
     */
    public function indexAction(Request $request)
    {
        $currencyService = $this->container->get('currency_service');
        $response = $currencyService->getExchangeData();

        $rates = json_decode($response->getRawData());
        $lastUpdated = $response->getDateUpdated()->format(self::DEFAULT_FORMAT);
        $recentDates = $currencyService->getRecentDates();
        $currencies = $currencyService->getCurrencyData();

        return $this->render('home/index.html.twig', [
            'exchange_rates' => $rates, // array_slice($rates, 0, 10),
            'last_updated' => $lastUpdated,
            'recent_dates' => $recentDates,
            'currencies' => array_column($currencies, 'code'),
        ]);
    }

    /**
     * @Route("/exchange_rates", name="retrieve_exchange_rates")
     */
    public function retrieveCurrenciesAction(Request $request)
    {
        $currencyService = $this->container->get('currency_service');

        $guid = $request->request->get('guid');
        $response = $currencyService->getExchangeData($guid);

        $jsonResponse = JsonResponse::fromJsonString($response->getRawData());
        return $jsonResponse;
    }

    /**
     * @Route("/tracker", name="retrieve_tracked_changes")
     */
    public function retrieveRatesChangesAction(Request $request)
    {
        $currencyService = $this->container->get('currency_service');
        $response = $currencyService->getRecentRateChange();

        $jsonResponse = JsonResponse::fromJsonString(json_encode($response));
        return $jsonResponse;
    }

    /**
     * @Route("/exchange_rates/date", name="retrieve_exchange_rates_by_date")
     */
    public function getAllCurrentMonthDatesAction(Request $request)
    {
        $currencyService = $this->container->get('currency_service');
        $date = $request->request->get('date');
        try {
            $response = $currencyService->getExchangeDataByDate($date);
            $jsonResponse = JsonResponse::fromJsonString(json_encode($response));
        } catch(\Exception $e) {
            $jsonResponse = new JsonResponse();
            $jsonResponse->setStatusCode(204);
        }
        return $jsonResponse;
    }
}
