$(document).ready(function () {
    $('.vehicle_brand_select').change(function (event) {
        let field = this,
            typeId = $(field).attr('data-type_id');

        if (field.value.length >= 3) {
            $.ajax({
                url: '/vehicle_models_by_brand',
                dataType: 'json',
                type: 'GET',
                data: {"vehicle_brand_id": this.value, "vehicle_type_id": typeId},
                success: function (response) {
                    let modelData = response.model_data,
                        tabId = "#vehicle_type_" + response.vehicle_type_id,
                        modelSelect = $(tabId).find('#vehicle_model_select' + response.vehicle_type_id)[0],
                        modelDataList = $(tabId).find('#vehicle_model' + response.vehicle_type_id)[0],
                        label = $(tabId).find('.state-disabled')[0];
debugger;
                        $(label).removeClass('state-disabled');
                        $(modelDataList).empty();
                        $(modelSelect).prop('disabled', false);
                        $(modelSelect).prop('value', null);
                        if (modelData.length > 0) {
                            for (i in modelData) {
                                $(modelDataList).append("<option value='" + modelData[i]['name'] + "'>" + modelData[i]['name'] + "</option>");
                            }
                        }
                },
                error: function (x, e) {

                }

            });
        }
    });
});