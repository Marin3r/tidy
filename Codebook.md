 
Code book
=========

**Tidy Data Project submission for **



* 	what variables I used
* 	names of columns and why
* 	units of data if known
* 	reference or link to original data info

For the first question, the answer is in their description- the data has been scaled by dividing by the range, and when you divide units by the same units, the units are cancelled. You will want to mention this in the codebook though.

The second, if you are talking about using a merge style command, the only time you might want to do that is applying the activity labels where the number in the y data matches the number in their description of the activities. The actual data blocks are first clipped together with rbind and cbind (merge is being used in the english language sense of combine in the project description).

i know the unit of acceleration is g, and the unit of gyroscope is rad/s, and mean,std,max etc are the same unit of it alone. But the activities also contains entropy, coefficients, frequency etc. I really don't know the physical meaning of that, so what are these units?


test