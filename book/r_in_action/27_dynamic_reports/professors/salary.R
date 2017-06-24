require(R2wd)
require(car)

df <- Salaries
n <- nrow(df)

fit <- lm(salary ~ rank*sex, data=df)

aovTable <- Anova(fit, type=3)
aovTable <- round(as.data.frame(aovTable), 3)
aovTable[is.na(aovTable)] <- ""

wdGet("SampleReport.doc", method="RDCOMClient")  
wdGoToBookmark("n")                  
wdWrite(n)

wdGoToBookmark("aovTable")                       
wdTable(aovTable, caption="Two-way Analysis of Variance", 
        caption.pos="above", pointsize=12, autoformat=4)

wdGoToBookmark("effectsPlot")            
myplot <- function(){
  require(effects)
  par(mar=c(2,2,2,2))
  plot(allEffects(fit), main="")
}
wdPlot(plotfun=myplot, caption="Mean Effects Plot",                                     
       height=4, width=5, method="metafile")

wdSave("SalaryReport2.doc")                        
wdQuit()
