package br.sistema.crud.jdbc.dto;

import java.io.Serializable;

public class UfDTO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 5869240029371553063L;
	private Integer idUF;
	private String siglaUF;
	public Integer getIdUF() {
		return idUF;
	}
	public void setIdUF(Integer idUF) {
		this.idUF = idUF;
	}
	public String getSiglaUF() {
		return siglaUF;
	}
	public void setSiglaUF(String siglaUF) {
		this.siglaUF = siglaUF;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descrcao) {
		this.descricao = descrcao;
	}
	private String descricao;

}
