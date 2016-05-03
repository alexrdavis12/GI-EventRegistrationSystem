$(document).ready(function(){
    $('#All').click(function(evt){
        if(this.checked){
            $('.checkbox1').each(function(){
                this.checked = true;
            });
        }
            else {
                $('.checkbox1').each(function(){
                    this.checked = false;
                });
            }
    });
});





function is_checked() {
    var All = document.getElementById('All').click();
    var Vendor = document.getElementById('Vendor').click();
    var Vehicle = document.getElementById('Vehicle').click();
    var Reinactors = document.getElementById('Reinactors').click();
    var Educators = document.getElementById('Educators').click();
    
    if(All == false && Vendor == false && Vehicle == false && Reinactors == false & Educators == false){
        alert('please select a role');
        return false;
    }
        else{
            return true;
        }
    
}