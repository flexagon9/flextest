({
	firePropertyFilterChangeEvent : function(component) {
        var myEvent = $A.get("e.c:PropertyFilterChange");
        myEvent.setParams({
            "searchKey": component.get("v.searchKey"),
            "minPrice": component.get("v.minPrice"),
            "maxPrice": component.get("v.maxPrice")
        });
        myEvent.fire();
    }
})