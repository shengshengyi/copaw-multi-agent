# Copaw Multi-Agent System

> 🚀 基于 Copaw 框架的多智能体系统配置示例 - 软件工程师助手专属版本

[![GitHub](https://img.shields.io/badge/GitHub-shengshengyi/copaw--multi--agent-blue)](https://github.com/shengshengyi/copaw-multi-agent)
[![License](https://img.shields.io/badge/License-MIT-green.svg)]()

---

## 📋 项目简介

本项目是 **Copaw 多智能体系统** 的配置示例，展示如何为特定场景（飞书群聊技术讨论）定制专属的 AI Agent。

通过本项目的配置，你可以快速部署一个专注于技术咨询的「软件工程师助手」，它能够：
- 🔍 自动响应群聊中的技术问题
- 💻 进行代码审查和优化建议
- 🏗️ 提供系统架构设计方案
- 🐛 帮助定位和修复 Bug
- 📚 积累团队技术知识和经验

---

## 🆚 与 Copaw 原项目的对比

| 特性 | Copaw 原项目 | 本项目 (Multi-Agent 版本) |
|------|-------------|-------------------------|
| **定位** | 通用型 AI 助手框架 | 垂直场景专用 Agent |
| **使用场景** | 个人工作空间、通用对话 | 飞书群聊技术讨论 |
| **Agent 数量** | 单 Agent 模式 | 支持多 Agent 切换 |
| **记忆管理** | 基础对话记忆 | 群聊上下文 + 项目记忆 + 代码片段 |
| **响应方式** | 被动响应（需@或触发） | 主动响应（无需@，直接回复） |
| **知识积累** | 个人工作区记忆 | 团队技术知识库 |
| **定时任务** | 个人提醒 | 群聊运营定时任务 |
| **频道绑定** | Console / 通用 IM | 飞书群聊专属绑定 |

### 🔑 核心差异详解

#### 1. 角色专业化

**Copaw 原项目：**
- 通用助手，适合多种场景
- 需要用户明确指令才知道该做什么
- 记忆围绕个人工作任务

**本项目：**
- 专业软件工程师角色
- 内置技术关键词触发机制
- 自动识别代码、报错、架构等技术话题
- 记忆围绕团队技术项目和成员专长

#### 2. 群聊运营能力

**Copaw 原项目：**
```
用户: @机器人 帮我看看这段代码
机器人: （响应）
```

**本项目：**
```
用户: 这段代码有个bug...
机器人: （自动识别并响应，无需@）
```

#### 3. 记忆维度扩展

| 记忆类型 | Copaw 原项目 | 本项目 |
|---------|-------------|--------|
| 对话历史 | ✅ | ✅ |
| 用户偏好 | ✅ | ✅ |
| 群成员档案 | ❌ | ✅ |
| 项目技术方案 | ❌ | ✅ |
| 代码片段库 | ❌ | ✅ |
| 技术债务追踪 | ❌ | ✅ |

#### 4. 定时任务升级

**Copaw 原项目：**
- 个人日程提醒
- 任务截止日期通知

**本项目：**
- 群聊技术热点总结
- 待解决技术问题跟进
- 周度/月度技术报告生成
- 长期未决问题标记

---

## 📁 项目结构

```
copaw-multi-agent/
├── AGENT_CONFIG.md          # Agent 配置文件（频道绑定、触发规则）
├── AGENTS.md                # 群聊运营手册（回复规范、运营策略）
├── BOOTSTRAP.md             # 首次运行引导（初始化对话）
├── HEARTBEAT.md             # 定时任务配置（群聊运营节奏）
├── MEMORY.md                # 记忆系统说明（群聊记忆管理）
├── PROFILE.md               # Agent 档案（基本信息、服务对象）
├── SOUL.md                  # 核心设定（性格、能力、原则）
├── README.md                # 项目说明文档
├── embedding_cache/         # 向量嵌入缓存
├── file_store/              # 文件存储（ChromaDB 等）
├── memory/                  # 群聊记忆目录
│   └── YYYY-MM-DD.md       # 每日群聊记录
└── tool_result/             # 工具执行结果
```

---

## 🚀 快速开始

### 前提条件

- Python 3.8+
- Copaw 框架已安装
- 飞书机器人已创建并获取相关凭证

### 安装步骤

1. **克隆仓库**
   ```bash
   git clone https://github.com/shengshengyi/copaw-multi-agent.git
   cd copaw-multi-agent
   ```

2. **配置环境变量**
   ```bash
   export FEISHU_APP_ID="your_app_id"
   export FEISHU_APP_SECRET="your_app_secret"
   export FEISHU_ENCRYPT_KEY="your_encrypt_key"
   export FEISHU_VERIFICATION_TOKEN="your_verification_token"
   ```

3. **启动服务**
   ```bash
   copaw run
   ```

### 配置说明

修改 `AGENT_CONFIG.md` 中的以下配置以适配你的群聊：

```yaml
# 飞书群聊绑定
群聊 ID: "oc_your_group_id"      # 替换为你的飞书群聊ID
群聊名称: "你的技术讨论群"        # 替换为你的群聊名称
```

---

## 🎯 使用场景

### 场景1：代码审查
```
群成员A: 大家帮我review一下这个PR
[代码片段]

软件工程师助手: 
> 这段代码有几个问题：
> 1. 第15行缺少空值检查
> 2. 可以用Stream API简化循环逻辑
> 3. 建议添加异常处理
```

### 场景2：Bug定位
```
群成员B: 报错了！NullPointerException at line 45

软件工程师助手:
> 这个错误通常是因为对象未初始化导致的。
> 建议检查：
> 1. userService是否已注入
> 2. getUserById返回值是否为null
> 3. 数据库连接是否正常
```

### 场景3：架构讨论
```
群成员C: 我们在考虑微服务拆分，有什么建议？

软件工程师助手:
> 从当前规模和业务复杂度来看，建议：
> 1. 按业务域拆分（用户、订单、支付）
> 2. 先拆出独立的数据库
> 3. 使用消息队列解耦
> 具体方案我可以详细展开...
```

---

## ⚙️ 自定义配置

### 修改触发关键词

编辑 `SOUL.md` 中的关键词列表：

```markdown
## 关键词触发

以下关键词会让我更积极地响应：
- 代码、PR、Review、Bug
- 架构、设计、选型、重构
- [添加你的关键词...]
```

### 调整响应时效

编辑 `AGENTS.md` 中的响应时效表：

```markdown
| 消息类型 | 响应时间 | 说明 |
|----------|----------|------|
| 代码/报错 | 30秒内 | 优先级最高 |
| [自定义类型] | [自定义时间] | [说明] |
```

### 配置定时任务

编辑 `HEARTBEAT.md` 添加自定义定时任务：

```markdown
## 自定义定时任务

### 每日 10:00 - 代码规范检查
- [ ] 扫描昨日提交的代码
- [ ] 检查是否符合团队规范
- [ ] 发送规范报告到群聊
```

---

## 🤝 贡献指南

欢迎提交 Issue 和 PR！

### 提交规范

- 使用清晰的 commit message
- 新增功能请更新文档
- 保持与 Copaw 原项目的兼容性

---

## 📄 许可证

MIT License - 详见 LICENSE 文件

---

## 🙏 致谢

- [Copaw](https://github.com/clawhub/copaw) - 基础框架
- [OpenAI](https://openai.com/) - AI 能力支持
- [飞书](https://www.feishu.cn/) - IM 平台支持

---

## 📞 联系方式

如有问题或建议，欢迎通过以下方式联系：

- GitHub Issues: [shengshengyi/copaw-multi-agent/issues](https://github.com/shengshengyi/copaw-multi-agent/issues)
- Email: [your-email@example.com]

---

> 💡 **提示**：本项目是一个配置示例，展示了如何将 Copaw 框架应用于特定的群聊场景。你可以基于此模板，为其他场景（如产品讨论群、运维值班群等）创建专属的 Agent。
