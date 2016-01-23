package br.puc.controller;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import br.puc.entidades.FrequenciaTermos;
import br.puc.funcoes.Arquivo;
import br.puc.funcoes.Hash;
import br.puc.funcoes.PreProcessamento;

public class CursoController {
	
	/**
	 * TODO
	 * @function 	calcularFrequenciaTermos calcula a quantidade de termos
	 *           	identicos em cada arquivo e alimenta a lista de frequencia dos
	 *           	termos com objetos referentes a frequencia da palavra em um
	 *           	determinado documento
	 * @param 		listaPalavras - lista com todas as palavras de um curso
	 * @param 		frequenciaDosTermos - lista de frequencia dos termos contendo as 
	 * 				frequencias ja calculadas
	 * @param 		curso - curso "dono" das palavras 
	 * @return 		Lista de objetos FrequenciaTermos
	 */
	public static List<FrequenciaTermos> calcularFrequenciaTermos(List<String> listaPalavras, List<FrequenciaTermos> frequenciaDosTermos, String curso) {

		String palavra = "";

		try {
			
			/*
			 * 	Para cada palavra ele verifica se ela ja existe na lista de frequencia, se nao ele insere ela na lista.
			 * 	Se existir, ele incrementa a frequencia dessa palavra
			 */
			for (int i = 0; i < listaPalavras.size(); i++) {

				FrequenciaTermos freqTermos = new FrequenciaTermos();

				boolean existe = false;

				palavra = listaPalavras.get(i);

				// Verifica se a palavra existe na lista
				for (int j = 0; j < frequenciaDosTermos.size(); j++) {

					if (frequenciaDosTermos.get(j).getPalavra().equals(palavra)) {
						if (frequenciaDosTermos.get(j).getCurso().equals(curso)) {
							existe = true;
							frequenciaDosTermos.get(j).setFrequencia(frequenciaDosTermos.get(j).getFrequencia() + 1);
						}
					}
				}

				// se a palavra nao existe na lista � montado um objeto de
				// frequencia de termos e esse objeto � inserido na lista
				if (existe == false) {
					freqTermos.setCurso(curso);
					freqTermos.setPalavra(palavra);
					freqTermos.setFrequencia(1);
					frequenciaDosTermos.add(freqTermos);
				}
			}
		} catch (Exception e) {
			System.out.println("Erro ao calcular a frequencia dos termos: " + e);
		}

		return (frequenciaDosTermos);
	}

	
	// Chamar no servlet
	
	/**
	 * TODO
	 * @function	gerarArquivoInvertido faz todas as opera��es necessarias para a cria��o do arquivo invertido,
	 * 				incluindo o pr�-processamento dos documentos e a cria��o da tabela hash.
	 * @param		caminho - caminho da pasta de documentos txt
	 * @return		TRUE tabela hash criada e salva em arquivo
	 * 				FALSE erro durante a execu��o do processo
	 */
	public boolean gerarArquivoInvertido(String caminho){

		Arquivo arq = new Arquivo();
		Hash hash = new Hash();
		List<FrequenciaTermos> frequenciaDosTermos = new ArrayList<FrequenciaTermos>();
		
		boolean retorno = false;

		try{
			
			//Faz a leitura de todos os arquivos do diretorio
			List<String> lista = arq.lerDiretorios(caminho);
			
			// Gera a lista de objetos do tipo FrequenciaTermos com todos os arquivos do diretorio
			for (int i = 0; i < lista.size(); i++) {
				
				//PR�-PROCESSAMENTO
				//lista com todas as palavras existentes nos arquivos
				List<String> listaPalavras = arq.lerArquivoCurso(lista.get(i), caminho);
				
				//retira as stopwords da lista de palavras
				List<String> listaPalavrasSemStopwords = PreProcessamento.removerStopwods(listaPalavras, caminho);
				
				//CALCULO DE FREQUENCIA DO TERMO NO DOCUMENTO
				//calcula a frequencia que cada palavra aparece nos documentos
				frequenciaDosTermos = calcularFrequenciaTermos(listaPalavrasSemStopwords, frequenciaDosTermos,lista.get(i).replaceAll(".txt", ""));
			}
	
			Hashtable<String, ArrayList<FrequenciaTermos>> hashtable = hash.gerarHash(frequenciaDosTermos);
			
			retorno = hash.GerarArquivoInvertido(hashtable, caminho);
		
		}catch(Exception e){
			System.out.println("Erro ao gerar arquivo invertido: " + e);
			return retorno;
		}
		
		return retorno;
	}
	
	/**
	 * 
	 * @param nome
	 * @param descricao
	 * @param caminho
	 * @return
	 */
	public static boolean salvarCurso(String curso, String descricao, String caminho){
		
		boolean status = Arquivo.gravarCurso(curso, descricao, caminho);
		
		return status;
	}
}
