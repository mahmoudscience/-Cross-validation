library(tidymodels)
library(readxl)
PISA<-read_xlsx(choose.files())
PISA
unique(PISA)
colnames(PISA)
set.seed(1234)
spliting_student<-initial_split(PISA,prop = 0.8)
spliting_student
training_student<-training(spliting_student)
training_student
Testing_student<-testing(spliting_student)
Testing_student
picking_model_settin_engine<-linear_reg()%>%
  set_engine("lm")
training_model_fitting<-picking_model%>%
  fit(science_score~math_score, data =training_student )
training_model_fitting
testing_model<-training_model_fitting%>%
  predict(new_data =Testing_student )
testing_model
testing_model<-training_model_fitting%>%
  predict(new_data =Testing_student )%>%
  mutate(truth=Testing_student$science_score)
testing_model
rmse(testing_model,truth=truth, estimate = .pred)
rsq(testing_model,truth = truth, estimate = .pred)