// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./4_identidad_adm.sol";

// Este otro contrato va permitir que los usuarios autorizados registren datos.
contract RegistroDatos {
    GestorUsuarios private gestorUsuarios;
    mapping(address => string[]) private registrosUsuario;

    constructor (address _direccionGestorUsuarios) {
        gestorUsuarios = GestorUsuarios(_direccionGestorUsuarios);
    }

    // FUNCION: Para registrar los datos
    function registrarDato (string memory _dato) public payable {
        require(gestorUsuarios.estaUsuarioRegistrado(msg.sender), "Debes estar registrado para registrar datos");
        registrosUsuario[msg.sender].push(_dato);
    }

    // FUNCION: Para obtener los registros 
    function obtenerRegistros() public view returns(string[] memory) {
        return registrosUsuario[msg.sender];
    }
}