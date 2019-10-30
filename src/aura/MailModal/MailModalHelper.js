({

     sendMail: function (component, event)
     {
        let action = component.get('c.sendEmail');
        action.setParam('inAddress' , component.get('v.email'));
        action.setParam('inAddressCc' , component.get('v.emailCC'));
        action.setParam('inSubject' , component.get('v.subject'));
        action.setParam('inBody' , JSON.stringify(component.get('v.imagesToSend')));
        action.setCallback(this, function(response) {

                let eventModal = $A.get("e.c:LEV_Modal");
                component.set('v.isVisible',false);
                eventModal.fire();

            });
        $A.enqueueAction(action);
     }


})