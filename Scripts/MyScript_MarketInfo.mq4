//+------------------------------------------------------------------+
//|                                         MyScript_Playgrounds.mq4 |
//|                        Copyright 2018, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2018, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart() {
//---
   Print(DoubleToStr(Close[0], Digits));
   printf("Symbol= %s",Symbol()); 
   printf("Low day price=%f\n",MarketInfo(Symbol(),MODE_LOW)); 
   printf("High day price=,MarketInfo=%f\n",MarketInfo(Symbol(),MODE_HIGH)); 
   printf("The last incoming tick time=%f\n",(MarketInfo(Symbol(),MODE_TIME))); 
   printf("Last incoming bid price=%f\n",MarketInfo(Symbol(),MODE_BID)); 
   printf("Last incoming ask price=%f\n",MarketInfo(Symbol(),MODE_ASK)); 
   printf("Point size in the quote currency=%f\n",MarketInfo(Symbol(),MODE_POINT)); 
   printf("Digits after decimal point=%f\n",MarketInfo(Symbol(),MODE_DIGITS)); 
   printf("Spread value in points=%f\n",MarketInfo(Symbol(),MODE_SPREAD)); 
   printf("Stop level in points=%f\n",MarketInfo(Symbol(),MODE_STOPLEVEL)); 
   printf("Lot size in the base currency=%f\n",MarketInfo(Symbol(),MODE_LOTSIZE)); 
   printf("Tick value in the deposit currency=%f\n",MarketInfo(Symbol(),MODE_TICKVALUE)); 
   printf("Tick size in points=%f\n",MarketInfo(Symbol(),MODE_TICKSIZE));  
   printf("Swap of the buy order=%f\n",MarketInfo(Symbol(),MODE_SWAPLONG)); 
   printf("Swap of the sell order=%f\n",MarketInfo(Symbol(),MODE_SWAPSHORT)); 
   printf("Market starting date (for futures)=%f\n",MarketInfo(Symbol(),MODE_STARTING)); 
   printf("Market expiration date (for futures)=%f\n",MarketInfo(Symbol(),MODE_EXPIRATION)); 
   printf("Trade is allowed for the symbol=%f\n",MarketInfo(Symbol(),MODE_TRADEALLOWED)); 
   printf("Minimum permitted amount of a lot=%f\n",MarketInfo(Symbol(),MODE_MINLOT)); 
   printf("Step for changing lots=%f\n",MarketInfo(Symbol(),MODE_LOTSTEP)); 
   printf("Maximum permitted amount of a lot=%f\n",MarketInfo(Symbol(),MODE_MAXLOT)); 
   printf("Swap calculation method=%f\n",MarketInfo(Symbol(),MODE_SWAPTYPE)); 
   printf("Profit calculation mode=%f\n",MarketInfo(Symbol(),MODE_PROFITCALCMODE)); 
   printf("Margin calculation mode=%f\n",MarketInfo(Symbol(),MODE_MARGINCALCMODE)); 
   printf("Initial margin requirements for 1 lot=%f\n",MarketInfo(Symbol(),MODE_MARGININIT)); 
   printf("Margin to maintain open orders calculated for 1 lot=%f\n",MarketInfo(Symbol(),MODE_MARGINMAINTENANCE)); 
   printf("Hedged margin calculated for 1 lot=%f\n",MarketInfo(Symbol(),MODE_MARGINHEDGED)); 
   printf("Free margin required to open 1 lot for buying=%f\n",MarketInfo(Symbol(),MODE_MARGINREQUIRED)); 
   printf("Order freeze level in points=%f\n",MarketInfo(Symbol(),MODE_FREEZELEVEL)); 

}
//+------------------------------------------------------------------+
