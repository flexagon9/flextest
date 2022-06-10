<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>AddressUpdateAction</fullName>
        <field>OwnerId</field>
        <lookupValue>rama.rimmalapudi@flexagon.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>AddressUpdateAction</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Address</fullName>
        <actions>
            <name>AddressUpdateAction</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Address__c.Name</field>
            <operation>equals</operation>
            <value>Rama</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
