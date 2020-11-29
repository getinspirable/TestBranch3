<aura:application >
     <!--<link href='/resource/bootstrap/' rel="stylesheet"/>-->
    <ltng:require styles="/resource/Bootstrap"/>
    
	<div class="navbar navbar-default navbar-static-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <a href="#" class="navbar-brand">Lightning Contacts</a>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                Contact list goes here
            </div>
        </div>
    </div>
    <div class="container">
    <div class="row">
        <div class="col-sm-4">
            <c:SearchBar/>
            <c:ContactList/>
        </div>
        <div class="col-sm-8">
            <c:ContactDisplay/>
        </div>
    </div>
</div>
</aura:application>