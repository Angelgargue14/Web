const rootStyles = getComputedStyle(document.documentElement);

const RojoViejo        = rootStyles.getPropertyValue('--RojoViejo').trim();
const GrisMedioViejo   = rootStyles.getPropertyValue('--GrisMedioViejo').trim();
const GrisClaroViejo   = rootStyles.getPropertyValue('--GrisClaroViejo').trim();
const BlancoRotoViejo  = rootStyles.getPropertyValue('--BlancoRotoViejo').trim();
const AmarilloViejo    = rootStyles.getPropertyValue('--AmarilloViejo').trim();
const GrisOscuroViejo  = rootStyles.getPropertyValue('--GrisOscuroViejo').trim();
const NegroClaroViejo  = rootStyles.getPropertyValue('--NegroClaroViejo').trim();

const RojoPrincipal     = rootStyles.getPropertyValue('--RojoPrincipal').trim();
const GrisCalido        = rootStyles.getPropertyValue('--GrisCalido').trim();
const BeigeClaro        = rootStyles.getPropertyValue('--BeigeClaro').trim();
const NegroGrisaceo     = rootStyles.getPropertyValue('--NegroGrisaceo').trim();
const OroViejo          = rootStyles.getPropertyValue('--OroViejo').trim();
const GrisFrio          = rootStyles.getPropertyValue('--GrisFrio').trim();
const VerdeOliva        = rootStyles.getPropertyValue('--VerdeOliva').trim();
//document.getElementById('unlogin').addEventListener('click', function() {
//    document.getElementById('bloqueo').style.display = 'flex'; // Cambia el display a flex
//}); 

//document.getElementById('loguear').addEventListener('click', function() {
//    document.getElementById('bloqueo').style.display = 'none'; // Cambia el display a none
//  }); 

function addDigit(digit) {
    const passwordField = document.getElementById('password');
    if (passwordField.value.length < 4) {
        passwordField.value += digit;
    }
}

function clearPassword() {
    document.getElementById('password').value = '';
}   



