module github.com/OpenCHAMI/bss

go 1.21

toolchain go1.21.5

replace google.golang.org/grpc => google.golang.org/grpc v1.29.1

require (
	github.com/Cray-HPE/hms-base v1.15.1
	github.com/Cray-HPE/hms-hmetcd v1.10.3
	github.com/Cray-HPE/hms-s3 v1.10.1
	github.com/docker/distribution v2.8.3+incompatible
	github.com/evanphx/json-patch v5.9.0+incompatible
	github.com/google/uuid v1.6.0
	github.com/jmoiron/sqlx v1.4.0
	github.com/lib/pq v1.10.9
	gopkg.in/yaml.v2 v2.4.0
)

require (
	github.com/Cray-HPE/hms-xname v1.3.0
	github.com/OpenCHAMI/jwtauth/v5 v5.0.0-20240321222802-e6cb468a2a18
	github.com/OpenCHAMI/smd/v2 v2.15.2
	github.com/go-chi/chi v1.5.5
	github.com/go-chi/chi/v5 v5.1.0
	github.com/golang-migrate/migrate/v4 v4.17.1
	github.com/hashicorp/go-retryablehttp v0.7.7
	github.com/lestrrat-go/jwx v1.2.30
	github.com/openchami/chi-middleware/auth v0.0.0-20240812224658-b16b83c70700
	github.com/openchami/chi-middleware/log v0.0.0-20240812224658-b16b83c70700
	github.com/rs/zerolog v1.33.0
)

require (
	github.com/Cray-HPE/hms-certs v1.4.0 // indirect
	github.com/Cray-HPE/hms-securestorage v1.13.0 // indirect
	github.com/aws/aws-sdk-go v1.55.5 // indirect
	github.com/cenkalti/backoff/v3 v3.2.2 // indirect
	github.com/coreos/etcd v3.3.27+incompatible // indirect
	github.com/coreos/go-semver v0.3.1 // indirect
	github.com/coreos/go-systemd v0.0.0-20191104093116-d3cd4ed1dbcf // indirect
	github.com/coreos/pkg v0.0.0-20240122114842-bbd7aa9bf6fb // indirect
	github.com/decred/dcrd/dcrec/secp256k1/v4 v4.3.0 // indirect
	github.com/fsnotify/fsnotify v1.7.0 // indirect
	github.com/go-chi/jwtauth/v5 v5.3.1 // indirect
	github.com/go-jose/go-jose/v3 v3.0.3 // indirect
	github.com/go-jose/go-jose/v4 v4.0.4 // indirect
	github.com/goccy/go-json v0.10.3 // indirect
	github.com/gogo/protobuf v1.3.2 // indirect
	github.com/golang/protobuf v1.5.4 // indirect
	github.com/hashicorp/errwrap v1.1.0 // indirect
	github.com/hashicorp/go-cleanhttp v0.5.2 // indirect
	github.com/hashicorp/go-multierror v1.1.1 // indirect
	github.com/hashicorp/go-rootcerts v1.0.2 // indirect
	github.com/hashicorp/go-secure-stdlib/parseutil v0.1.8 // indirect
	github.com/hashicorp/go-secure-stdlib/strutil v0.1.2 // indirect
	github.com/hashicorp/go-sockaddr v1.0.6 // indirect
	github.com/hashicorp/hcl v1.0.1-vault-5 // indirect
	github.com/hashicorp/vault/api v1.14.0 // indirect
	github.com/jmespath/go-jmespath v0.4.0 // indirect
	github.com/lestrrat-go/backoff/v2 v2.0.8 // indirect
	github.com/lestrrat-go/blackmagic v1.0.2 // indirect
	github.com/lestrrat-go/httpcc v1.0.1 // indirect
	github.com/lestrrat-go/httprc v1.0.6 // indirect
	github.com/lestrrat-go/iter v1.0.2 // indirect
	github.com/lestrrat-go/jwx/v2 v2.1.1 // indirect
	github.com/lestrrat-go/option v1.0.1 // indirect
	github.com/mattn/go-colorable v0.1.13 // indirect
	github.com/mattn/go-isatty v0.0.20 // indirect
	github.com/mitchellh/go-homedir v1.1.0 // indirect
	github.com/mitchellh/mapstructure v1.5.0 // indirect
	github.com/pkg/errors v0.9.1 // indirect
	github.com/ryanuber/go-glob v1.0.0 // indirect
	github.com/segmentio/asm v1.2.0 // indirect
	github.com/sirupsen/logrus v1.9.3 // indirect
	go.etcd.io/etcd v3.3.27+incompatible // indirect
	go.uber.org/atomic v1.11.0 // indirect
	go.uber.org/multierr v1.11.0 // indirect
	go.uber.org/zap v1.27.0 // indirect
	golang.org/x/crypto v0.26.0 // indirect
	golang.org/x/net v0.28.0 // indirect
	golang.org/x/sys v0.24.0 // indirect
	golang.org/x/text v0.17.0 // indirect
	golang.org/x/time v0.6.0 // indirect
	google.golang.org/genproto v0.0.0-20240812133136-8ffd90a71988 // indirect
	google.golang.org/genproto/googleapis/api v0.0.0-20240812133136-8ffd90a71988 // indirect
	google.golang.org/genproto/googleapis/rpc v0.0.0-20240812133136-8ffd90a71988 // indirect
	google.golang.org/grpc v1.65.0 // indirect
	google.golang.org/protobuf v1.34.2 // indirect
)
