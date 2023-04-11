({
    fetchTasks: function(component, event, helper) {
        component.set('v.mycolumns', [{
                label: 'Subject',
                fieldName: 'subjectLink',
                type: 'url',
                typeAttributes: {
                    label: {
                        fieldName: 'Subject'
                    },
                    target: '_blank'
                }
            },
            {
                label: 'Due Date',
                fieldName: 'ActivityDate',
                type: "date",
                typeAttributes: {
                    weekday: "long",
                    year: "numeric",
                    month: "long",
                    day: "2-digit"
                }
            },
            {
                label: 'Demo Formula',
                fieldName: 'DemoLink',
                type: "url",
                typeAttributes: {
                    label: {
                        fieldName: 'Priority'
                    },
                    target: '_blank'
                }
            },
            {
                label: 'Related To',
                fieldName: 'WhatId',
                type: 'url',
                typeAttributes: {
                    label: {
                        fieldName: 'WhatName'
                    },
                    target: '_blank'
                }
            },
            {
                label: 'Status',
                fieldName: 'Status',
                cellAttributes: {
                    iconName: {
                        fieldName: 'statusIconName'
                    },
                    iconLabel: {
                        fieldName: 'statusIconLabel'
                    },
                    iconPosition: 'right'
                }
            },
            {
                label: 'Assigned To',
                fieldName: 'OwnerId',
                type: 'url',
                typeAttributes: {
                    label: {
                        fieldName: 'OwnerName'
                    },
                    target: '_blank'
                }
            }
 
        ]);
        var action = component.get("c.getTaskList");
        action.setParams({});
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var records = response.getReturnValue();
                records.forEach(function(record) {
                    record.WhatName = record.What.Name;
                    record.WhatId = '/' + record.WhatId;
                    record.Priority = record.Priority;
                    record.DemoLink = '/lightning/o/Task/home';
                    record.OwnerName = record.Owner.Name;
                    record.OwnerId = '/' + record.OwnerId;
                    record.subjectLink = '/' + record.Id;
                    if (record.Status === 'Not Started') {
                        record.statusIconName = 'standard:assignment';
                        record.statusIconLabel = record.Status;
                        record.Status = '';
                    }
                    if (record.Status === 'In Progress') {
                        record.statusIconName = 'standard:investment_account';
                        record.statusIconLabel = record.Status;
                        record.Status = '';
                    }
                    if (record.Status === 'Waiting on someone else') {
                        record.statusIconName = 'standard:call';
                        record.statusIconLabel = record.Status;
                        record.Status = '';
                    }
                    if (record.Status === 'Deferred') {
                        record.statusIconName = 'standard:first_non_empty';
                        record.statusIconLabel = record.Status;
                        record.Status = '';
                    }
                    if (record.Status === 'Completed') {
                        record.statusIconName = 'standard:task2';
                        record.statusIconLabel = record.Status;
                        record.Status = '';
                    }
                });
                console.log(records);
 
            }
            component.set("v.taskList", records);
        });
        $A.enqueueAction(action);
    }
})