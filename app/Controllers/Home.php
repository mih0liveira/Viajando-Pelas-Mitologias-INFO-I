<?php 
namespace App\Controllers;
use CodeIgniter\Controller;
use App\Models\ConteudoModel;

class Home extends Controller
{
	public function index(){
		//return view('welcome_message');
		$model = new ConteudoModel();
		$data['conteudo'] = $model->getConteudo();
		echo view('templates/Header');
		echo view('pages/Home',$data);
		echo view('templates/Footer');
	}	
	public function item($id=NULL){
		//retorna um conteúdo específico
		$model = new ConteudoModel();
		$data['conteudo'] = $model->getConteudoItem($id);
		echo view('templates/Header');
		echo view('pages/ConteudoItem',$data);
		echo view('templates/Footer');
	}
	public function aluno(){
		$model = new ConteudoModel();
		$data['conteudo'] = $model->getConteudo();
		echo view('templates/Header');
		echo view('pages/HomeAluno',$data);
		echo view('templates/Footer');
	}
}
