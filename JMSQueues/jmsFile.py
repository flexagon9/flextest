def createQueue(ModuleName, QueueName, QueueJNDIName):
    ref = getMBean('/JMSSystemResources/' + ModuleName + '/JMSResource/' + ModuleName + '/Queues/' + QueueName)
    if ref is None:
        ref = getMBean('/JMSSystemResources/' + ModuleName + '/JMSResource/' + ModuleName)
        if ref is None:
            raise Exception("The JMSModule, " + ModuleName + " wasn't available.")
        else:
            jmsqueue1 = ref.createQueue(QueueName)
            jmsqueue1.setJNDIName(QueueJNDIName)
    else:
        print("Queue " + QueueName + " already exists.")

edit()
startEdit()
        
createQueue("FDJMSModule", "FDQueue1", "FDJMSqueue1")
createQueue("FDJMSModule", "FDQueue2", "FDJMSqueue2")
createQueue("FDJMSModule", "FDQueue3", "FDJMSqueue3")

save()
activate()
disconnect()