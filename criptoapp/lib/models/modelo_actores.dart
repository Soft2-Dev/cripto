class Coins {
  List<Coin> dato = [];
  Coins();

  Coins.fromlist(List<dynamic> datos) {
    if (datos == null) return;

    for (var item in datos) {
      final detalle = Coin.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

// "id": "bitcoin",
// "symbol": "btc",
// "name": "Bitcoin",
// "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
// "current_price": 17440.41,
// "market_cap": 336742312366,
// "market_cap_rank": 1,
// "fully_diluted_valuation": 368241305388,
// "total_volume": 76946730080,
// "high_24h": 17789.6,
// "low_24h": 15663.49,
// "price_change_24h": -276.73432593583857,
// "price_change_percentage_24h": -1.56196,
// "market_cap_change_24h": 1132201337,
// "market_cap_change_percentage_24h": 0.33736,
// "circulating_supply": 19203681,
// "total_supply": 21000000,
// "max_supply": 21000000,
// "ath": 69045,
// "ath_change_percentage": -74.60092,
// "ath_date": "2021-11-10T14:24:11.849Z",
// "atl": 67.81,
// "atl_change_percentage": 25761.9562,
// "atl_date": "2013-07-06T00:00:00.000Z",
// "roi": null,
// "last_updated": "2022-11-10T14:49:52.502Z"

class Coin {
  String? id;
  String? symbol;
  String? name;
  String? image;
  String? currentPrice;
  String? marketCap;
  String? marketCapRank;
  String? fullyDilutedValuation;
  String? totalVolume;
  String? high24h;
  String? low24h;
  String? priceChange24h;
  String? priceChangePercentage24h;
  String? marketCapChange24h;
  String? marketCapChangePercentage24h;
  String? circulatingSupply;
  String? totalSupply;
  String? maxSupply;
  String? ath;
  String? athChangePercentage;
  String? athDate;
  String? atl;
  String? atlChangePercentage;
  String? atlDate;
  String? roi;
  String? lastUpdated;

  Coin({
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.currentPrice,
    this.marketCap,
    this.marketCapRank,
    this.fullyDilutedValuation,
    this.totalVolume,
    this.high24h,
    this.low24h,
    this.priceChange24h,
    this.priceChangePercentage24h,
    this.marketCapChange24h,
    this.marketCapChangePercentage24h,
    this.circulatingSupply,
    this.totalSupply,
    this.maxSupply,
    this.ath,
    this.athChangePercentage,
    this.athDate,
    this.atl,
    this.atlChangePercentage,
    this.atlDate,
    this.roi,
    this.lastUpdated,
  });

  Coin.fromJsonMap(Map<String, dynamic> datos) {
    id = datos['id'].toString();
    symbol = datos['symbol'].toString();
    name = datos['name'].toString();
    image = datos['image'].toString();
    currentPrice = datos['current_price'].toString();
    marketCap = datos['market_cap'].toString();
    marketCapRank = datos['market_cap_rank'].toString();
    fullyDilutedValuation = datos['fully_diluted_valuation'].toString();
    totalVolume = datos['total_volume'].toString();
    high24h = datos['high_24h'].toString();
    low24h = datos['low_24h'].toString();
    priceChange24h = datos['price_change_24h'].toString();
    priceChangePercentage24h = datos['price_change_percentage_24h'].toString();
    marketCapChange24h = datos['market_cap_change_24h'].toString();
    marketCapChangePercentage24h =
        datos['market_cap_change_percentage_24h'].toString();
    circulatingSupply = datos['circulating_supply'].toString();
    totalSupply = datos['total_supply'].toString();
    maxSupply = datos['max_supply'].toString();
    ath = datos['ath'].toString();
    athChangePercentage = datos['ath_change_percentage'].toString();
    athDate = datos['ath_date'].toString();
    atl = datos['atl'].toString();
    atlChangePercentage = datos['atl_change_percentage'].toString();
    atlDate = datos['atl_date'].toString();
    roi = datos['roi'].toString();
    lastUpdated = datos['last_updated'].toString();
  }
}
