import os
import hcl2
import pytest
import googleapiclient.discovery


@pytest.fixture(scope='session')
def project():
    return os.environ['CLOUDSDK_CORE_PROJECT']


@pytest.fixture(scope='session')
def region(request):
    NETWORK_VARIABLES_FILE = f'network/{request.config.option.environment}/terraform.auto.tfvars'
    with open(NETWORK_VARIABLES_FILE, 'r') as f:
        variables = hcl2.load(f)
    return variables['region']


@pytest.fixture(scope='session')
def name(request):
    SERVER_VARIABLES_FILE = f'application/{request.config.option.environment}/terraform.auto.tfvars'
    with open(SERVER_VARIABLES_FILE, 'r') as f:
        variables = hcl2.load(f)
    return f'{variables["team"]}-{variables["environment"]}'


@pytest.fixture(scope='session')
def servers(project, region, name):
    servers = []
    compute = googleapiclient.discovery.build('compute', 'v1')
    result = compute.instances().aggregatedList(
        filter=f'name:"{name}"', project=project).execute()
    items = result['items'] if 'items' in result else None
    for zone, instances in items.items():
        if region in zone:
            servers += instances['instances'] \
                if 'instances' in instances else []
    return servers


def test_only_one_server_named_for_team_and_environment(servers):
    assert len(servers) == 1
