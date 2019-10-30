({

    init : function(component,event, helper)
    {
        helper.init(component);
    },

    searchClick : function(component,event, helper)
    {
        helper.searchClick(component);
    },
    openModalToSend : function (component,event,helper)
    {
        helper.openModalToSend(component,event);
    },
    hideModal : function (component, event, helper)
    {
        component.set("v.showModal",false);
    }

})