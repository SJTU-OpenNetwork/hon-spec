scp root@159.138.132.28:/root/go/bin/textile /usr/local/bin/
textile wallet create
textile init ""
scp root@202.120.38.100:/home/yongxi/.textile/repo/swarm.key /root/.textile/repo/

textile ipfs swarm connect /ip4/202.120.38.100/tcp/22612/ipfs/12D3KooWMsnTufaczYVEMYEo3q3PP9XrkJvHMEfQark6sZoEVm9U
