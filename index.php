<script type="text/javascript">
/*
	var pageTracker = _gat._getTracker("UA-21205605-3");

	pageTracker._setMaxCustomVariables(10);

	pageTracker._setCustomVar(1,'visitor_var_1','visitor_value_1',1);
	pageTracker._setCustomVar(2,'visitor_var_2','visitor_value_2',1);
	pageTracker._setCustomVar(3,'visitor_var_3','visitor_value_3',1);
	pageTracker._setCustomVar(4,'visitor_var_4','visitor_value_4',1);
	pageTracker._setCustomVar(5,'visitor_var_5','visitor_value_5',1);
	pageTracker._setCustomVar(6,'visitor_var_6','visitor_value_6',1);
	pageTracker._setCustomVar(7,'visitor_var_7','visitor_value_7',1);
	pageTracker._setCustomVar(8,'visitor_var_8','visitor_value_8',1);
	pageTracker._setCustomVar(9,'visitor_var_9','visitor_value_9',1);
	pageTracker._setCustomVar(10,'visitor_var_10','visitor_value_10',1);

	pageTracker._trackPageview();
*/
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-21205605-3']);
//  _gaq.push(['_setMaxCustomVariables',10]);
  _gaq.push(['_trackPageview']);
  _gaq.push(['_setCustomVar',
      2,                   // This custom var is set to slot #2.  Required parameter.
      'Shopping Attempts', // The name of the custom variable.  Required parameter.
      'Yes',               // The value of the custom variable.  Required parameter.
                           //  (you might set this value by default to No)
      2                    // Sets the scope to session-level.  Optional parameter.
   ]);
  _gaq.push(['_setCustomVar',
      1,                   // This custom var is set to slot #2.  Required parameter.
      'Hello', // The name of the custom variable.  Required parameter.
      'No',               // The value of the custom variable.  Required parameter.
                           //  (you might set this value by default to No)
      1                    // Sets the scope to session-level.  Optional parameter.
   ]);


  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<pre>
<?php

print_r($_COOKIE);


?>
</pre>