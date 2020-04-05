<?php

namespace AppBundle\Command;

use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use AppBundle\Service\CurrencyService;
use GuzzleHttp\Client;

class ExchangeRateCommand extends Command
{
    const RSS_PATH = 'https://www.bank.lv/vk/ecb_rss.xml';

    protected static $defaultName = 'app:exchange-rate-update';

    public function __construct(CurrencyService $currencyService)
    {
        $this->currencyService = $currencyService;
        parent::__construct();
    }

    protected function configure()
    {
        $this->setDescription('Updates currency exchange rates');
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $client = new Client();
        $response = $client->request('GET', self::RSS_PATH);

        $xml = simplexml_load_string($response->getBody(), null, LIBXML_NOCDATA);

        $data = $this->currencyService->updateEntries($xml);

        echo "ENTRIES UPDATED\n";
    }
}
