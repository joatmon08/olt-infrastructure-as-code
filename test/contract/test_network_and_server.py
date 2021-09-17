import pytest
import hcl2

SERVER_INPUTS_FILE = 'server/variables.tf'


@pytest.fixture
def outputs(request):
    NETWORK_OUTPUTS_FILE = f'network/{request.config.option.environment}/outputs.tf'
    with open(NETWORK_OUTPUTS_FILE, 'r') as f:
        output = hcl2.load(f)
    return output['output']


@pytest.fixture
def inputs():
    with open(SERVER_INPUTS_FILE, 'r') as f:
        input = hcl2.load(f)
    return input['variable']


def test_network_output_should_be_region(outputs):
    output_includes_region = False
    for output in outputs:
        if 'region' in output.keys() and 'var.region' in output['region']['value']:
            output_includes_region = True
    assert output_includes_region


def test_server_input_should_not_include_region(inputs):
    for variable in inputs:
        if 'region' in variable.keys():
            pytest.fail(
                'do not pass region as explicit variable, use network outputs')
