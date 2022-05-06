library('doParallel');  registerDoParallel(makeCluster(detectCores()-1,type='FORK'))
