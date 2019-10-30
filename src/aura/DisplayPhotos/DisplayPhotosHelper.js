({
    init : function(component)
    {
        let action = component.get('c.retrieveImages');
        component.set("v.showSpinner",true);
        action.setCallback(this, function(response)
        {
            if(response.getState() === 'SUCCESS')
            {
                let result = response.getReturnValue();
                if(result.length>0)
                {
                    component.set("v.photos" , result);
                    component.set("v.photosIsNotEmpty" , false);
                }

            }
            component.set("v.showSpinner",false);
        });
        $A.enqueueAction(action);
    },

    searchClick : function(component, event)
    {
        let searchText = component.get('v.searchText');
        let action = component.get('c.searchByTitle');
        component.set("v.showSpinner" , true);
        action.setParams({inTitle: searchText});
        action.setCallback(this, function(response) {
        if ( response.getState() === 'SUCCESS') {
            let result = response.getReturnValue();
            if(result.length>0)
            {
                component.set("v.photos" , result);
                component.set("v.photosIsNotEmpty" , false);
            }
        }
        component.set("v.showSpinner" , false);
        });
        $A.enqueueAction(action);
    },
    openModalToSend : function (component,event)
    {
        component.set("v.showModal",true);
    }


})