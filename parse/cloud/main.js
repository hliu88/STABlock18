// Use Parse.Cloud.define to define as many cloud functions as you want.

Parse.Cloud.define("scheduleForDate", function(request, response)
{
	
	/*
	
	Run this code in terminal to compile seperately:
	
	curl -X POST \
  		-H "X-Parse-Application-Id: E2fcuHjMvDFx6Ug06t9AQn9AaHeowyiXV8z7urqZ" \
  		-H "X-Parse-REST-API-Key: Vmr4nwTDiA2ahPAZDLZxIFAuPaBmFLP450xhxtiU" \
  		-H "Content-Type: application/json" \
  		-d '{}' \
  		https://api.parse.com/1/functions/scheduleForDate
	
	*/
	
   	var today = new Date();

   	var dd = today.getDate();
   	var mm = today.getMonth() + 1;		// January is 0!
   	var yyyy = today.getFullYear();
	
	var hh = today.getHours();
	var minutes = today.getMinutes();
	var ss = today.getSeconds();
	
	var minutesInHours = minutes/60;	//  # of hours in decimal form representing minutes
	var secondsInHours = (ss/60)/60;	//  # of hours in decimal form representing seconds
	
	var howFarIntoCalculatedDay = hh + minutesInHours + secondsInHours;
	
	if (howFarIntoCalculatedDay < 4)	// Compensates for timezone offset
	{
		dd = dd - 1;
	}
	
	dd = dd - 1;
	
   	yesterday = mm + '/' + dd + '/' + yyyy; // Using yesterday for No School Fade Images (Now there a 9 in array rather than 7)
	
	/*
	
	if (hh < 4)
	{
		var hoursIntoActualDay = 24 + (hh - 4);
	} 
	else
	{
		var hoursIntoActualDay = hh - 4;
	}
	
	today2 = mm + '/' + dd + '/' + yyyy + ' @ ' + hoursIntoActualDay + ':' + minutes + ':' + ss;
	
	
	if (today == '08/03/2014') response.success("Same date");
	else response.success("Different Date");
	
	response.success(today);		// Left testing scaffloding in case of future problems
	
	*/
	
	/*
	
	for (var i = 0; i < 1; i++)
	{
		if (mm == 1)
		{
			response.success("It Works");
		} else if (mm == 08)
		{
			response.success("It Sorta Works");
		else if (mm == '08')
		{
			response.success(mm + 1);
		} else
		{
			response.success("Fuck");
		}
	}
	
	*/

	var scheduleNumbers = new Array();
	
	for (var i = 0; i < 9; i++)
	{

		switch (yesterday) //Which date does it match and what to do depending on the answer
		{
			case "9/2/2015":
			case "9/14/2015":
			case "9/23/2015":
			case "10/5/2015":
			case "10/16/2015":
			case "10/27/2015":
			case "11/5/2015":
			case "11/17/2015":
			case "12/1/2015":
			case "12/10/2015":
			case "1/4/2016":
			case "1/26/2016":
			case "2/4/2016":
			case "2/17/2016":
			case "2/26/2016":
			case "3/8/2016":
			case "3/17/2016":
			case "4/11/2016":
			case "4/21/2016":
			case "5/3/2016":
			case "5/12/2016":
				scheduleNumbers[i] = 1;
				break;
			case "9/3/2015":
			case "9/15/2015":
			case "9/24/2015":
			case "10/6/2015":
			case "10/19/2015":
			case "10/28/2015":
			case "11/9/2015":
			case "11/18/2015":
			case "12/2/2015":
			case "12/11/2015":
			case "1/5/2016":
			case "1/27/2016":
			case "2/5/2016":
			case "2/18/2016":
			case "2/29/2016":
			case "3/9/2016":
			case "3/18/2016":
			case "4/13/2016":
			case "4/22/2016":
			case "5/4/2016":
			case "5/13/2016":
				scheduleNumbers[i] = 2;
				break;
			case "9/4/2015":
			case "9/16/2015":
			case "9/28/2015":
			case "10/7/2015":
			case "10/20/2015":
			case "10/29/2015":
			case "11/10/2015":
			case "11/19/2015":
			case "12/3/2015":
			case "12/14/2015":
			case "1/6/2016":
			case "1/28/2016":
			case "2/8/2016":
			case "2/19/2016":
			case "3/1/2016":
			case "3/10/2016":
			case "4/4/2016":
			case "4/14/2016":
			case "4/26/2016":
			case "5/5/2016":
			case "5/16/2016":
				scheduleNumbers[i] = 3;
				break;
			case "9/8/2015":
			case "9/17/2015":
			case "9/29/2015":
			case "10/8/2015":
			case "10/21/2015":
			case "10/30/2015":
			case "11/11/2015":
			case "11/20/2015":
			case "12/4/2015":
			case "12/15/2015":
			case "1/7/2016":
			case "1/20/2016":
			case "1/29/2016":
			case "2/9/2016":
			case "2/22/2016":
			case "3/2/2016":
			case "3/11/2016":
			case "4/5/2016":
			case "4/15/2016":
			case "4/27/2016":
			case "5/6/2016":
			case "5/17/2016":
				scheduleNumbers[i] = 4;
				break;
			case "9/9/2015":
			case "9/18/2015":
			case "9/30/2015":
			case "10/13/2015":
			case "10/22/2015":
			case "11/2/2015":
			case "11/12/2015":
			case "11/23/2015":
			case "12/7/2015":
			case "12/16/2015":
			case "1/8/2016":
			case "1/21/2016":
			case "2/1/2016":
			case "2/10/2016":
			case "2/23/2016":
			case "3/3/2016":
			case "3/14/2016":
			case "4/6/2016":
			case "4/18/2016":
			case "4/28/2016":
			case "5/9/2016":
			case "5/18/2016":
				scheduleNumbers[i] = 5;
				break;
			case "9/10/2015":
			case "9/21/2015":
			case "10/1/2015":
			case "10/14/2015":
			case "10/23/2015":
			case "11/3/2015":
			case "11/13/2015":
			case "11/24/2015":
			case "12/8/2015":
			case "12/17/2015":
			case "1/22/2016":
			case "2/2/2016":
			case "2/11/2016":
			case "2/24/2016":
			case "3/4/2016":
			case "3/15/2016":
			case "4/7/2016":
			case "4/19/2016":
			case "4/29/2016":
			case "5/10/2016":
			case "5/19/2016":
				scheduleNumbers[i] = 6;
				break;
			case "9/11/2015":
			case "9/22/2015":
			case "10/2/2015":
			case "10/15/2015":
			case "10/26/2015":
			case "11/4/2015":
			case "11/16/2015":
			case "11/30/2015":
			case "12/9/2015":
			case "12/18/2015":
			case "1/25/2016":
			case "2/3/2016":
			case "2/16/2016":
			case "2/25/2016":
			case "3/7/2016":
			case "3/16/2016":
			case "4/8/2016":
			case "4/20/2016":
			case "5/2/2016":
			case "5/11/2016":
			case "5/20/2016":
				scheduleNumbers[i] = 7;
				break;
			case "9/1/2015":
			case "9/25/2015":
				scheduleNumbers[i] = 8;
				break;
			default:
		    	scheduleNumbers[i] = 0;
				break;
		}
		
		if ((mm == 1 || mm == 3 || mm == 5 || mm == 7 
			|| mm == 8 || mm == 10 || mm == 12) && (dd == 31))
			{
				if (mm < 12)
				{
					mm += 1;
				} else
				{
					mm = 1;
					yyyy += 1;
				}
				dd = 1;
				yesterday = mm + '/' + dd + '/' + yyyy;
			}
			else if ((mm == 4 || mm == 6 || mm == 9 || mm == 11) && (dd == 30))
			{
				mm += 1;
				dd = 1;
				yesterday = mm + '/' + dd + '/' + yyyy;
			}
			else if ((mm == 2) && (yyyy != 2016) && (dd == 28)) // For non leap years
			{
				mm += 1;
				dd = 1;
				yesterday = mm + '/' + dd + '/' + yyyy;
			}
			else if ((mm == 2) && (yyyy == 2016) && (dd == 29)) // For leap years
			{
				mm += 1;
				dd = 1;
				yesterday = mm + '/' + dd + '/' + yyyy;
			}
			else
			{
				dd += 1;
				yesterday = mm + '/' + dd + '/' + yyyy;
			}

	}
	
	response.success(scheduleNumbers);
	
});