from datetime import timedelta

from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from airflow.utils.dates import days_ago

default_args = {
    'owner': 'CONAM_FIAP',
    'depends_on_past': False,
    'start_date': days_ago(2),
    'email': ['giusepper11@gmail.com'],
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
    'catchup': False
}

template_cmd = """
cd $AIRFLOW_HOME/dags/dataOps-assessment/Pipelines/{{params.pipeline_folder}}/{{params.pipeline_folder}}
chmod +x {{params.pipeline_folder}}_run.sh
bash {{params.pipeline_folder}}_run.sh
"""

dag = DAG(
    'talend-etls',
    default_args=default_args,
    description='ETLs do TALEND',
    schedule_interval=timedelta(days=1),
    catchup=False
)

t1 = BashOperator(
    task_id='Aula2_Exploracao',
    bash_command=template_cmd,
    dag=dag,
    params={'pipeline_folder': 'Aula2_Exploracao'}
)

t2 = BashOperator(
    task_id='Aula2_Vendas',
    bash_command=template_cmd,
    dag=dag,
    params={'pipeline_folder': 'Aula2_Vendas'}
)

t3 = BashOperator(
    task_id='Aula3_Exploracao',
    bash_command=template_cmd,
    dag=dag,
    params={'pipeline_folder': 'Aula3_Exploracao'}
)

t4 = BashOperator(
    task_id='Aula3_ProdutosPorRegiao',
    bash_command=template_cmd,
    dag=dag,
    params={'pipeline_folder': 'Aula3_ProdutosPorRegiao'}
)

t5 = BashOperator(
    task_id='Aula3_RankVendedores',
    bash_command=template_cmd,
    dag=dag,
    params={'pipeline_folder': 'Aula3_RankVendedores'}
)

t6 = BashOperator(
    task_id='Aula3_RelatorioSemanal',
    bash_command=template_cmd,
    dag=dag,
    params={'pipeline_folder': 'Aula3_RelatorioSemanal'}
)

t1 >> t2 >> t3 >> t4 >> t5 >> t6
