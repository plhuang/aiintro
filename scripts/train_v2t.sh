#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$PROJECT_DIR"

# NOTE: use absolute paths, modify according to your setting.
DATA_DIR="${DATA_DIR:-/hdd/huangpl/aiintro_final_project/final_project_data/30h_data}"
TOKENIZER_PATH="${TOKENIZER_PATH:-/hdd/huangpl/aiintro_final_project/final_project_data/spm1000/spm_unigram1000.model}"
PRETRAIN_PATH="${PRETRAIN_PATH:-/hdd/huangpl/aiintro_final_project/final_project_ckpt/pretrained_model.pth}"
RUN_DIR="${RUN_DIR:-/hdd/huangpl/aiintro_final_project/run_dir/exp_v2t}"

export PYTHONPATH="$PROJECT_DIR:${PYTHONPATH:-}"
python -u main.py --config-dir "$PROJECT_DIR/configs/" \
  --config-name video2text.yaml \
  task.data="$DATA_DIR" \
  task.label_dir="$DATA_DIR" \
  task.tokenizer_bpe_model="$TOKENIZER_PATH" \
  model.pretrained_path="$PRETRAIN_PATH" \
  hydra.run.dir="$RUN_DIR" \
  common.user_dir="$PROJECT_DIR" \
  "$@"
