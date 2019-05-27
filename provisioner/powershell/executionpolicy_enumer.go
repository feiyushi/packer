// Code generated by "enumer -transform snake -trimprefix ExecutionPolicy -type ExecutionPolicy"; DO NOT EDIT.

//
package powershell

import (
	"fmt"
)

const _ExecutionPolicyName = "bypassallsigneddefaultremotesignedrestrictedundefinedunrestrictednone"

var _ExecutionPolicyIndex = [...]uint8{0, 6, 15, 22, 34, 44, 53, 65, 69}

func (i ExecutionPolicy) String() string {
	if i < 0 || i >= ExecutionPolicy(len(_ExecutionPolicyIndex)-1) {
		return fmt.Sprintf("ExecutionPolicy(%d)", i)
	}
	return _ExecutionPolicyName[_ExecutionPolicyIndex[i]:_ExecutionPolicyIndex[i+1]]
}

var _ExecutionPolicyValues = []ExecutionPolicy{0, 1, 2, 3, 4, 5, 6, 7}

var _ExecutionPolicyNameToValueMap = map[string]ExecutionPolicy{
	_ExecutionPolicyName[0:6]:   0,
	_ExecutionPolicyName[6:15]:  1,
	_ExecutionPolicyName[15:22]: 2,
	_ExecutionPolicyName[22:34]: 3,
	_ExecutionPolicyName[34:44]: 4,
	_ExecutionPolicyName[44:53]: 5,
	_ExecutionPolicyName[53:65]: 6,
	_ExecutionPolicyName[65:69]: 7,
}

// ExecutionPolicyString retrieves an enum value from the enum constants string name.
// Throws an error if the param is not part of the enum.
func ExecutionPolicyString(s string) (ExecutionPolicy, error) {
	if val, ok := _ExecutionPolicyNameToValueMap[s]; ok {
		return val, nil
	}
	return 0, fmt.Errorf("%s does not belong to ExecutionPolicy values", s)
}

// ExecutionPolicyValues returns all values of the enum
func ExecutionPolicyValues() []ExecutionPolicy {
	return _ExecutionPolicyValues
}

// IsAExecutionPolicy returns "true" if the value is listed in the enum definition. "false" otherwise
func (i ExecutionPolicy) IsAExecutionPolicy() bool {
	for _, v := range _ExecutionPolicyValues {
		if i == v {
			return true
		}
	}
	return false
}
