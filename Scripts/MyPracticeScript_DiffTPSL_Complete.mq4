//+------------------------------------------------------------------+
//|                                 MyPracticeScript_Conditional.mq4 |
//|                        Copyright 2014, MetaQuotes Software Corp. |
//|                                              http://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2014, MetaQuotes Software Corp."
#property link      "http://www.mql5.com"
#property version   "1.00"
#property strict

// Created by Lucas Liew, blackalgotechnologies.com

//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+

extern double TP = 50;
extern double SL = 30;
   
void OnStart()
  {
//---
 
 // Create a function that finds the difference between the Take-Profit and Stop-Loss levels
 // Output it using Print
 // Resources: http://book.mql4.com/basics/functions
 
   Print(sum(TP, SL));
   noResult();
   
  }
//+------------------------------------------------------------------+

// ---------- Functions ----------

double sum(double a, double b) {

   double sum;
   
   sum = a + b; // Eg. Entered 1.5000. TP 1.5050, SL 1.4970. 

   if (sum > 10) {
      return 0;
   }
   return(sum);
}

void noResult() {
   Print("noResult");
   return;
}
