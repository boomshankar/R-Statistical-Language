
1. Data import and exploration 
Name of converted csv file : yelp.csv
To read the data into R, we use the read.csv() function,
>test = read.csv(file=”yelp.csv” , header = TRUE , sep= ’,’)
To obtain summary of the data, we use summary() function,
>summary(test)
The summary output is,
     business_id                                    	 full_address   
 --5jkZ3-nUPZxUvtcbr8Uw:          1 	 7014 E Camelback Rd\nScottsdale, AZ 85251:   38  
 --BlvDO_RG2yElKu9XA1_g:         1  	 Phoenix, AZ                              :   24  
 -_0Dx-cEvnQ0w2mauUpyXA:     1  	 2000 E Rio Salado Pkwy\nTempe, AZ 85281  :   19  
 -_JBgygYYD_UkuD-GVTp6A:       1   	21001 N Tatum Blvd\nPhoenix, AZ 85050    :   18  
 -_K8AE722c1u9Dsa8jo_vg:         1   	5000 S Arizona Mills Cir\nTempe, AZ 85282:   17  
 -_Ke8q969OAwEE_-U0qUjw:     1   	7000 E Mayo Blvd\nPhoenix, AZ 85054      :   14  
   (Other)               :11530                  	(Other)                                  :11406  
  open                                               categories  
 False: 1224   			['Mexican', 'Restaurants']                                : 528  
 True :10312   			['Pizza', 'Restaurants']                                  : 281  
               			['Hotels & Travel', 'Event Planning & Services', 'Hotels']: 227  
               			['Food', 'Coffee & Tea']                                  : 225  
               			['Restaurants']                                           : 202  
               			['Beauty & Spas', 'Nail Salons']                          : 199  
             			 	(Other)                                                   :9874  
 city       			review_count                 	 name      			 neighborhoods
 Phoenix   :4154   	Min.   :  3.00   		Subway          :   68  		 []:11536     
 Scottsdale:2024   	1st Qu.:  4.00   		McDonald's      :   53                
 Tempe     :1153   	Median :  6.00   		Starbucks       :   46                
 Mesa      : 898   		Mean   : 20.19   		Taco Bell       :   39                
 Chandler  : 865   	3rd Qu.: 16.00   		Discount Tire   :   33                
 Glendale  : 610   	Max.   :862.00   		Starbucks Coffee:   33                
 (Other)   :1832                    			(Other)         :11264  
              
 longitude      		state          	stars          		latitude          	 	type      
 Min.   :-112.9   		AZ:11533   	Min.   :1.000  		 Min.   :32.88  		business:11536  
 1st Qu.:-112.1   	CA:    1   	1st Qu.:3.000   		1st Qu.:33.39                   
 Median :-112.0   	CO:    1   	Median :3.500  		 Median :33.49                   
 Mean   :-112.0   	SC:    1   	Mean   :3.674   		Mean   :33.49                   
 3rd Qu.:-111.9              			3rd Qu.:4.500   		3rd Qu.:33.58                   
 Max.   :-111.3             			 Max.   :5.000   		Max.   :34.00

(a) Histogram of continuous attribute with the largest range,
 
Attribute	Range
Latitude	1.2
Longitude	0.4
Review Count	859
Stars	4.000

The continuous attribute with the largest range is review count and the histogram is obtained using the hist() function,
> hist(test$review_count, main='Histogram of Review Count', ylab = 'Frequency of Review Count', xlab = 'Review Count', breaks=100)
The histogram using breaks =100 so as to get a more detailed plot is,

 (b) The discrete attribute with the maximum number of values and plot a barplot to show the frequency of each value
The discrete attribute with the maximum number of values is categories,
> barplot(xtabs(~test$categories), main = 'Barplot of Categories', xlab = 'Types of Category', ylab = 'Frequency', names.arg = 'Beauty    Restaurants    Food     Hotels  Mexican Pizza')
The barplot obtained is,
 

2. Scatterplots and correlation
The four continuous attributes are latitude, longitude, review count and stars. The pairwise correlation among them using pearson (default), spearman and kendall are as follow,
Correlation of longitude and latitude:
> cor(test$latitude,test$longitude)
 -0.4410321
> cor(test$latitude,test$longitude, method="spearman")
 -0.4769828
> cor(test$latitude,test$longitude, method="kendall")
 -0.3256276 
Correlation of latitude and review count:
> cor(test$latitude,test$review_count)
 -0.006111501
> cor(test$latitude,test$review_count, method="spearman")
 0.007503303
> cor(test$latitude,test$review_count, method="kendall")
 0.005260659
Correlation of latitude and stars:
> cor(test$latitude,test$stars)
 0.02684269
> cor(test$latitude,test$stars, method="spearman")
 0.02515132
> cor(test$latitude,test$stars, method="kendall")
 0.01790812
Correlation of longitude and review count:
> cor(test$longitude,test$review_count)
 0.01094161
> cor(test$longitude,test$review_count, method="spearman")
 -0.005357947
> cor(test$longitude,test$review_count, method="kendall")
 -0.00344515
Correlation of longitude and stars:
> cor(test$longitude,test$stars)
 0.02780344
> cor(test$longitude,test$stars, method="spearman")
 0.02508018
> cor(test$longitude,test$stars, method="kendall")
 0.01802489
Correlation of review count and stars:
> cor(test$review_count,test$stars)
 0.05526101
> cor(test$review_count,test$stars, method="spearman")
 -0.0005827784
> cor(test$review_count,test$stars, method="kendall")
 0.002329123
According to pearson’s method, the pair with the largest positive correlation is review count and stars and the the scatterplot is:
> plot(test$stars, test$review_count, main="Correlation of Stars to Review Count", xlab="Stars", ylab="Review Count") 

The pair of attributes with the largest negative correlation is of latitude and longitude, the scatterplot of the following is:
>plot(test$latitude, test$review_count, main="Correlation of Latitude to Review Count", xlab="Latitude", ylab="Review Count")
