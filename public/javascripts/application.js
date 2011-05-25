// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
                $('#timepicker').timepicker({
                    showPeriod: true,
                    onMinuteShow: timepicker7OnMinuteShowCallback
                });
            function timepicker7OnHourShowCallback(hour) {
                if ((hour > 20)) {
                    return false;
                }
                return true;
            }
            function timepicker7OnMinuteShowCallback(hour, minute) {
                if (minute == 05 || minute == 10 || minute == 15 || minute == 20 || minute == 25 || minute == 35
                    || minute == 40 || minute == 45 || minute == 50 || minute == 55) { return false; }
                return true;
            }

    
  $(function() {
    $( "#datepicker" ).datepicker({
      minDate: 0,
      maxDate: "+2M",
      beforeShowDay: disableSpecificWeekDays

    });
  });

   function disableSpecificWeekDays(date) {
                var day = date.getDay();
                for (i = 1; i < daysToDisable.length; i++) {
                    if ($.inArray(day, daysToDisable) != -1) {
                        return [false];
                    }
                }
                return [true];
            }


  $("#location_day_tokens").tokenInput("/dayavailables.json", {
    crossDomain: false,
    prePopulate: $("#location_day_tokens").data("pre"), 
    hintText: "Pick available days",
    searchDelay: 140,
    preventDuplicates: true,
    theme: 'facebook'
  });

  if ($('#same_above_person').attr("checked")) {
		$('#medicalhistory_resp_name').val($('#medicalhistory_fname').val());
		$('#medicalhistory_resp_name').attr("readonly", "readonly");
		$('#resp_date').val($('#date').val())
		$('#resp_date').attr("readonly", "readonly");
    $('#resp_address').val($('#medicalhistory_address').val());
    $('#resp_address').attr("readonly", "readonly");
    $('#resp_city').val($('#medicalhistory_city').val());
    $('#resp_city').attr("readonly", "readonly");
    $('#resp_state').val($('#medicalhistory_state').val());
    $('#resp_state').attr("readonly", "readonly");
    $('#resp_zipo').val($('#zip').val());
    $('#resp_zipo').attr("readonly", "readonly");
    $('#resp_phone').val($('#phone').val());
    $('#resp_phone').attr("readonly", "readonly");
    $('#resp_phoneExt').val($('#phoneExt').val());
    $('#resp_phoneExt').attr("readonly", "readonly");
    $('#resp_ssn').val($('#ssn').val());
    $('#resp_ssn').attr("readonly", "readonly");
    $('#resp_empl').val($('#medicalhistory_emp').val());
    $('#resp_empl').attr("readonly", "readonly");
    $('#resp_term').val($('#medicalhistory_emp_term').val());
    $('#resp_term').attr("readonly", "readonly");
    $('#resp_occupation').val($('#medicalhistory_occupation').val());
    $('#resp_occupation').attr("readonly", "readonly");
    $('#resp_relation').val("N/A");
    $('#resp_relation').attr("readonly","readonly");
  }

//same as above
  $('#same_above_person').change(function () {
    if ($(this).attr("checked")) {
        $('#medicalhistory_resp_name').val($('#medicalhistory_fname').val());
        $('#medicalhistory_resp_name').attr("readonly", "readonly");
      $('#resp_date').val($('#date').val())
      $('#resp_date').attr("readonly", "readonly");
      $('#resp_address').val($('#medicalhistory_address').val());
      $('#resp_address').attr("readonly", "readonly");
      $('#resp_city').val($('#medicalhistory_city').val());
      $('#resp_city').attr("readonly", "readonly");
      $('#resp_state').val($('#medicalhistory_state').val());
      $('#resp_state').attr("readonly", "readonly");
      $('#resp_zipo').val($('#zip').val());
      $('#resp_zipo').attr("readonly", "readonly");
      $('#resp_phone').val($('#phone').val());
      $('#resp_phone').attr("readonly", "readonly");
      $('#resp_phoneExt').val($('#phoneExt').val());
      $('#resp_phoneExt').attr("readonly", "readonly");
      $('#resp_ssn').val($('#ssn').val());
      $('#resp_ssn').attr("readonly", "readonly");
      $('#resp_empl').val($('#medicalhistory_emp').val());
      $('#resp_empl').attr("readonly", "readonly");
      $('#resp_term').val($('#medicalhistory_emp_term').val());
      $('#resp_term').attr("readonly", "readonly");
      $('#resp_occupation').val($('#medicalhistory_occupation').val());
      $('#resp_occupation').attr("readonly", "readonly");
      $('#resp_relation').val("N/A");
      $('#resp_relation').attr("readonly","readonly");
        return;
    }
	//unchecked
	  $('#medicalhistory_resp_name').val("");
	  $('#medicalhistory_resp_name').removeAttr("readonly");
	  $('#resp_date').val("");
	  $('#resp_date').removeAttr("readonly");
    $('#resp_address').val("");
    $('#resp_address').removeAttr("readonly");
    $('#resp_city').removeAttr("readonly");
    $('#resp_state').removeAttr("readonly");
    $('#resp_zipo').removeAttr("readonly");
    $('#resp_phone').removeAttr("readonly");
    $('#resp_phoneExt').removeAttr("readonly");
    $('#resp_ssn').removeAttr("readonly");
    $('#resp_term').removeAttr("readonly");
    $('#resp_occupation').removeAttr("readonly");
    $('#resp_relation').removeAttr("readonly");
    $('#resp_empl').removeAttr("readonly");
    $('#resp_city').val("");
    $('#resp_state').val("");
    $('#resp_zipo').val("");
    $('#resp_phone').val("");
    $('#resp_phoneExt').val("");
    $('#resp_ssn').val("");
    $('#resp_term').val("");
    $('#resp_occupation').val("");
    $('#resp_relation').val("");
  });


  function getAge(birthDate) {
    var now = new Date();

    function isLeap(year) {
      return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
    }

    // days since the birthdate    
    var days = Math.floor((now.getTime() - birthDate.getTime())/1000/60/60/24);
    var age = 0;
    // iterate the years
    for (var y = birthDate.getFullYear(); y <= now.getFullYear(); y++){
      var daysInYear = isLeap(y) ? 366 : 365;
      if (days >= daysInYear){
        days -= daysInYear;
        age++;
        // increment the age only if there are available enough days for the year.
      }
    }
      return age;
  }

  $(function() {
  
        $("#age").attr("readonly", "readonly");
        $.mask.definitions['~'] = "[+-]";
        $("#age").mask("99");
        $("#date").mask("99/99/9999",{completed:function(){
          var birthDateStr = this.val().replace(/\//g,"");
          parts = birthDateStr.match(/(\d{2})(\d{2})(\d{4})/);
          dateObj = new Date(parts[3], parts[1], parts[2]-1);
          var age = getAge(dateObj);
         $("#age").val(age);
         //$("#age").attr("readonly", "readonly");
        }});
        $("#date1").mask("99/99/9999");
        $("#date2").mask("99/99/9999");
        $("#resp_date").mask("99/99/9999");
        $("#spouse_date").mask("99/99/9999");
        $("#phone").mask("(999) 999-9999");
        $("#pager").mask("(999) 999-9999");
        $("#resp_phone").mask("(999) 999-9999");
        $("#resp_phoneExt").mask("(999) 999-9999? x99999");
        $("#spouse_workph").mask("(999) 999-9999? x99999");
        $("#cellphone").mask("(999) 999-9999");
        $("#phoneExt").mask("(999) 999-9999? x99999");
        $("#iphone").mask("+33 999 999 999");
        $("#tin").mask("99-9999999");
        $("#ssn").mask("999-99-9999");
        $("#insuredssn").mask("999-99-9999");
        $("#resp_ssn").mask("999-99-9999");
        $("#product").mask("a*-999-a999", { placeholder: " " });
        $("#eyescript").mask("~9.99 ~9.99 999");
        $("#po").mask("PO: aaa-999-***");
        $("#pct").mask("99%");
        $("#zip").mask("99999");
        $("#resp_zipo").mask("99999");
        $("#zipo").mask("99999");


        $("input").blur(function() {
            $("#info").html("Unmasked value: " + $(this).mask());
        }).dblclick(function() {
            $(this).unmask();
        });
    });


});
