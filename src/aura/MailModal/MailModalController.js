({

    sendMail: function (component, event, helper)
    {
        helper.sendMail(component, event);
    },
    cancelClick : function (component, event)
    {
        let eventModal = $A.get("e.c:LEV_Modal");
        component.set('v.isVisible',false);
        eventModal.fire();

    }

})