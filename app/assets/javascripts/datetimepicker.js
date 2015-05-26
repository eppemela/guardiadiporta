$(document).ready(function () {
  $('#datetimepicker').datetimepicker();
  $('#datetimepicker').data("DateTimePicker").maxDate(new Date());
  $('#datetimepicker').on("dp.change", function(e) {
    var date = $('#datetimepicker').data("DateTimePicker").date();
    var formatted_date = new Date(date).format("yyyy-mm-dd");

    $('#timeline-embed').html('');

    createStoryJS({
      width: '100%',
      height: '600',
      start_at_end: false,
      font: 'DroidSerif-DroidSans',
      lang: 'it',
      type: 'timeline',
      source: '/timeline.json?day_to_display='+formatted_date,
      embed_id: 'timeline-embed'
    });

  });
});
