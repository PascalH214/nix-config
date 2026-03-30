if [[ -d /opt/rocm ]]; then
  export ROCM_PATH="/opt/rocm"
  export HSA_OVERRIDE_GFX_VERSION="11.0.0"
  export ROCM_VISIBLE_DEVICES="0"

  case ":$PATH:" in
    *":/opt/rocm/bin:"*) ;;
    *) PATH="$PATH:/opt/rocm/bin" ;;
  esac

  export LD_LIBRARY_PATH="/opt/rocm/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
fi

if command -v gamemoderun >/dev/null 2>&1; then
  export GAMEMODE="1"
  export GAMEMODERUNEXEC="env"
  export VKD3D_FEATURE_LEVEL="12_1"
  export WINE_CPU_TOPOLOGY="4:2"
  export PROTON_NO_ESYNC="0"

  if [[ -d /opt/rocm ]]; then
    export RADV_PERFTEST="aco,navi10_ngg_culling"
    export MESA_DRIVER="radeonsi"
  fi
fi
