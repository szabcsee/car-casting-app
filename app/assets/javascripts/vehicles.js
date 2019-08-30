$(document).ready(function(){
   $('.vehicle_brand_select').change(function(event){
       let field = this;
       if (field.value.length >= 3) {
           $.ajax({
               url: '/vehicle_models_by_brand',
               dataType: 'json',
               type: 'GET',
               data: {"vehicle_brand_id": this.value, "vehicle_type_id": $("#vehicle_vehicle_type_id")[0].value},
               success: function(response) {
                   let array = response.model_data,
                       tabId = "#vehicle_type_" + response.vehicle_type_id,
                       modelSelect = $(tabId).find('.vehicle_model_select')[0],
                       modelDataList = $(tabId).find('#vehicle_model')[0];
                   $(modelSelect).prop('disabled', false);
                   if (array.length > 0) {
                       for(i in array) {
                           $(modelDataList).append("<option value='"+array[i]['name']+"'>"+array[i]['name']+"</option>");
                       }
                   }

               },
               error: function(x, e) {

               }

           });
       }
   });
});