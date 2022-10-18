/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


let numeroCandidato = document.getElementById('numeroCandidato');


function alterarNumero(numero) {
    if (numeroCandidato.value.length < 5) {
        numeroCandidato.value += numero;
    }
}

function corrigir() {
    numeroCandidato.value = ''
}