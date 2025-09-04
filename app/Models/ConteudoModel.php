<?php
namespace App\Models;
use CodeIgniter\Model;

class ConteudoModel extends Model{
	//Atributos de configuração
	protected $table = 'conteudo';
	protected $primaryKey = 'ID_Conteudo';
	//Campos editáveis
	protected $allowedFields = ['Titulo','Texto_curto','Texto_completo','Imagem'];
	//Método para apresentar os registros
	public function getConteudo(){
		return $this->findAll();
	}
	//Método para registro específico
	public function getConteudoItem($id){
		return $this->asArray()->where(['ID_Conteudo'=>$id])->first();	
	}
}
?>