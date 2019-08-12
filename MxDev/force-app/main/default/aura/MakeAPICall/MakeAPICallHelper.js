({
    onHandleClick : function(component, event, helper) {
        // Get the action of Controller (Apex) Class
        var action = component.get('c.makeAPICall');
     
        // set the callback which will return the response from apex
        action.setCallback(this, function(response){
            // get the state
            var state = response.getState();
            if( (state === 'SUCCESS' || state ==='DRAFT') && component.isValid()){
                // parse the response
                let jsonResponse = JSON.parse(response.getReturnValue());
                Object.keys(jsonResponse).forEach(e => console.log(`${e}  Max = ${jsonResponse[e].Max} Remaining = ${jsonResponse[e].Remaining}`));
                
                // define an set all variables
                component.set("v.HourlyODataCallout", JSON.stringify(jsonResponse.HourlyODataCallout).replace(/[^a-zA-Z0-9\s:,]/g,""));
                component.set("v.DailyApiRequestsMax", JSON.stringify(jsonResponse.DailyApiRequests.Max));
                component.set("v.DailyApiRequestsRemaining", JSON.stringify(jsonResponse.DailyApiRequests.Remaining));
                component.set("v.DailyBulkApiRequestsMax", JSON.stringify(jsonResponse.DailyBulkApiRequests.Max));
                component.set("v.DailyBulkApiRequestsRemaining", JSON.stringify(jsonResponse.DailyBulkApiRequests.Remaining));
                component.set("v.DailyStandardVolumePlatformEvents", JSON.stringify(jsonResponse.DailyStandardVolumePlatformEvents).replace(/[^a-zA-Z0-9\s:,]/g,""));
                component.set("v.MonthlyPlatformEvents", JSON.stringify(jsonResponse.MonthlyPlatformEvents).replace(/[^a-zA-Z0-9\s:,]/g,""));
                component.set("v.HourlyLongTermIdMapping", JSON.stringify(jsonResponse.HourlyLongTermIdMapping).replace(/[^a-zA-Z0-9\s:,]/g,""));
                component.set("v.HourlyShortTermIdMapping", JSON.stringify(jsonResponse.HourlyShortTermIdMapping).replace(/[^a-zA-Z0-9\s:,]/g,""));
                component.set("v.DataStorageMB", JSON.stringify(jsonResponse.DataStorageMB).replace(/[^a-zA-Z0-9\s:,]/g,""));
                component.set("v.FileStorageMB", JSON.stringify(jsonResponse.FileStorageMB).replace(/[^a-zA-Z0-9\s:,]/g,""));
                component.set("v.DailyGenericStreamingApiEventsMax", JSON.stringify(jsonResponse.DailyGenericStreamingApiEvents.Max));
                component.set("v.DailyGenericStreamingApiEventsRemaining", JSON.stringify(jsonResponse.DailyGenericStreamingApiEvents.Remaining));
                       
            } else if( state === 'INCOMPLETE'){
                console.log("User is offline, device doesn't support drafts.");
            } else if( state === 'ERROR'){
                console.log('Problem saving record, error: ' + JSON.stringify(response.getError()));
            } else{
                console.log('Unknown problem, state: ' + state + ', error: ' + JSON.stringify(response.getError()));
            }
        });
        // send the action to the server which will call the apex and will return the response
        $A.enqueueAction(action);
    }
})