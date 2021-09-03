import pytest
import json
import re

DRY_RUN_FILE = 'network/plan.json'


@pytest.fixture
def dry_run():
    with open(DRY_RUN_FILE, 'r') as f:
        return json.load(f)


@pytest.fixture
def network(dry_run):
    resources = dry_run['planned_values']['root_module']['resources']
    for resource in resources:
        if resource['type'] == 'google_compute_network':
            return resource


def test_network_name_should_contain_environment(network):
    name = network['values']['name']
    assert re.compile('[a-z]+-(dev|prod)').match(name) is not None


def test_network_mtu_should_not_be_set(network):
    mtu = network['values']['mtu']
    assert mtu == 0
