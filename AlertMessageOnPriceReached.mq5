//+------------------------------------------------------------------+
//|                                   AlertMessageOnPriceReached.mq5 |
//|                                Copyright 2018, InvestDataSystems |
//|                 https://tradingbot.wixsite.com/robots-de-trading |
//+------------------------------------------------------------------+
#property copyright "Copyright 2018, InvestDataSystems"
#property link      "https://tradingbot.wixsite.com/robots-de-trading"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---

//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---

  }

input double askPriceToReach=1;
double ask, bid;
bool done=false;
MqlTick mqlTick;
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   if(done==false)
     {
      SymbolInfoTick(Symbol(), mqlTick);
      ask = mqlTick.ask;
      bid = mqlTick.bid;
      if (ask >= askPriceToReach)
      {  
         SendNotification("Ask >= " + DoubleToString(askPriceToReach));
         SendNotification("Ask = " + DoubleToString(ask));
         done = true;
      }
     }
  }
//+------------------------------------------------------------------+

