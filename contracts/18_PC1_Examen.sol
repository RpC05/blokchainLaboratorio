// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Elecciones256985 {
    struct Acta {
        uint256 id;
        string centroVotacion;
        uint256 votosValidos;
        bool observada;
    }

    Acta[] public actas;

    uint256 public posicion;
    address public direccion;

    constructor(uint256 _posicion) {
        posicion = _posicion;
        direccion = msg.sender;
    }

}