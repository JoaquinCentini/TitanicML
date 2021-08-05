data <- titanic_train
data_split <- initial_split(data)
train <- training(data_split)
test <- testing(data_split)

data_rec <- recipe(Survived ~ .,train) %>% 
  step_mutate(Survived = ifelse(Survived==0, "Died","Survived")) %>% 
  step_string2factor(Survived) %>% 
  step_rm(PassengerId,Name,Ticket,Cabin) %>% 
  step_impute_mean(Age) %>% 
  step_dummy(all_nominal(),-all_outcomes()) %>% 
  step_zv(all_predictors()) %>% 
  step_center(all_predictors(),-all_nominal()) %>% 
  step_scale(all_predictors(),-all_nominal())

data_prep <- data_rec %>% 
  prep()

fitted_model <- logistic_reg() %>% 
  set_engine("glm") %>% 
  set_mode("classification") %>% 
  fit(Survived ~ ., data=bake(data_prep,train))

predictions <- fitted_model %>% 
  predict(new_data=bake(data_prep,test)) %>% 
  bind_cols(
    bake(data_prep,test) %>% 
      select(Survived)
  )

predict_user_data <- function(data){
  print(data_prep)
  print(data)
  prediction_user <- fitted_model %>% 
    predict(new_data=bake(data_prep,data))
  prediction_user
}