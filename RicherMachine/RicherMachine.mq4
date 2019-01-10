//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2012,  CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+

// Note
// OrderSend(Currency, TradeType, lots, StartPrice, slipage, stoploss, takeprofit, comment, magic, expiration, arrow_color)

// iBandPeriod - range of candle
// iBandDeviations -
// iBandShift - shift from period
// fiboWidth - fibo width
// lots - lots
// slippage - accept value to init trade,  pip
extern int iBandPeriod=20;
extern double iBandDeviations=2;
extern int iBandShift=0;
extern double fiboWidth=100;
extern double lots=0.1;
extern int slippage=3;

//MARK: Constant
int limit=4;

//MARK: Storage
int tradeDate=0;
double iBandUpper,iBandLower;
int running=1;
int orderBuy,orderSell;
int orderOpenedTicket;
double buyStartPrice,sellStartPrice;
double fiboMid;
double fiboUpper1,fiboUpper2,fiboUpper3;
double fiboLower1,fiboLower2,fiboLower3;





//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int start()
  {
// Init
   iBandUpper = iBands(_Symbol, _Period, iBandPeriod, iBandDeviations, iBandShift, PRICE_CLOSE, MODE_UPPER, 1);
   iBandLower = iBands(_Symbol, _Period, iBandPeriod, iBandDeviations, iBandShift, PRICE_CLOSE, MODE_LOWER, 1);
   resetTradeDate();
   
   //RMOrder test[4];
   //Print("RMOrders", ArrayResize(test));

// Event 1: Start pending 
   if(tradeDate==0 && Close[1]>iBandUpper)
     {
      fiboMid=Bid;
      fiboUpper1=Bid+(fiboWidth*Point);
      fiboUpper2=Bid+((fiboWidth*Point)*2);
      fiboUpper3=Bid+((fiboWidth*Point)*3);
      fiboLower1=Bid-(fiboWidth*Point);
      fiboLower2=Bid-((fiboWidth*Point)*2);
      fiboLower3=Bid-((fiboWidth*Point)*3);
      orderBuy=OrderSend(Symbol(),OP_BUYSTOP,currentLots(),fiboUpper1,slippage,fiboMid,fiboUpper2,iBandUpper,0,0,DodgerBlue);
      orderSell=OrderSend(Symbol(),OP_SELLSTOP,currentLots(),fiboLower1,slippage,fiboMid,fiboLower2,iBandLower,0,0,DeepPink);
      tradeDate=TimeDay(TimeCurrent());
      running+=1;
      clearStorage();
      return(0);
     }

// Event 2: Decision to delete pending order
   for(int n=OrdersTotal()-1; n>=0; n--)
     {
      if(OrderSelect(n,SELECT_BY_POS))
        {
         if(OrderType()==OP_BUY && orderSell!=NULL)
           {
            orderOpenedTicket=OrderTicket();
            OrderDelete(orderSell);
            orderSell=NULL;
            break;
           }
         else if(OrderType()==OP_SELL && orderBuy!=NULL)
           {
            orderOpenedTicket=OrderTicket();
            OrderDelete(orderBuy);
            orderBuy=NULL;
            break;
           }
           } else {
         logError("OrderSelect()",GetLastError());
        }
     }

// Event 3: Check order close
   if(OrdersHistoryTotal()>0)
     {
      if(OrderSelect(orderOpenedTicket,SELECT_BY_TICKET,MODE_HISTORY))
        {
         if(orderOpenedTicket!=NULL)
           {
            if(StringFind(OrderComment(),"[sl]")>=0)
              {
               Print("StopLoss Hit: ",orderOpenedTicket,"Comment",OrderComment());
               if(OrderType()==OP_BUY)
                 {
                  orderSell=OrderSend(Symbol(),OP_SELL,currentLots(),sellStartPrice,slippage,sellStartPrice+(fiboWidth*Point),sellStartPrice-(fiboWidth*Point),iBandLower,0,0,DeepPink);
                 }
               else if(OrderType()==OP_SELL)
                 {
                  orderBuy=OrderSend(Symbol(),OP_BUY,currentLots(),buyStartPrice,slippage,buyStartPrice -(fiboWidth*Point),buyStartPrice+(fiboWidth*Point),iBandUpper,0,0,DodgerBlue);
                 }
               running+=1;
               orderOpenedTicket=NULL;
              }
            if(StringFind(OrderComment(),"[tp]")>=0)
              {
               Print("TakeProfit Hit: ",orderOpenedTicket,"Comment",OrderComment());
               running-=1;
               orderOpenedTicket=NULL;
              }
           }
        }
     }
   clearStorage();
   return(0);
  }
  
 
  
  
  
  
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void resetTradeDate()
  {
   if(tradeDate!=TimeDay(TimeCurrent()))
     {
      tradeDate=0;
     }
   return;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void clearStorage()
  {
   buyStartPrice=NULL;
   sellStartPrice=NULL;
   return;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double currentLots()
  {
   return lots * running;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void logEvent(string message)
  {
   Print("----------Event----------: ",message);
   return;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void logError(string message,int lastError)
  {
   Print("Error: ",message,"LastError: ",lastError);
   return;
  }
//+------------------------------------------------------------------+
